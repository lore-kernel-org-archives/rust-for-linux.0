Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4A13B8950;
	Tue,  3 Mar 2026 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549739; cv=fail; b=NDxc8q3VP1Ygu3GhMvp9BL3198lM6Nubv1e966e098kNMv+aswRkCmNhjOelrJ0djp2wyfkHpAhnLFfjjUOsQ9x9VyWJ2Jyz+IGbtXGUbUX1l9ljiU/AgmGjSRUv3uQ1UO7C01CAJf5jAXHwMIsjHiZfDA+u88kU0+yJxkmFPIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549739; c=relaxed/simple;
	bh=5wBVUI8kbNief4aLPDi/wj17YQa4ev9VTSxLdr5MVEo=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=NfuWrlHYSa0dRGqhjcKo4Ge6ViXnOrNIvg/sdjLF+QNU0aqqkzfVckhUwFBDIk0XYS1LxZgIU/SJ94ksY7vOU75BptB5DRfFUho3U7hh+LH259tPflq4YAm/OEkQA1MGl/94PgvmPjmHZZRNs3+upVxyXW2f13PzWfAI/yRueGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L26dqFSr; arc=fail smtp.client-ip=52.101.85.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L26dqFSr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foOmVW0o/1EaI4LxnsupEGeQgHQ/zKxL+BybhJEpHFHOmoL/xi+3hUiEMfzNt+UVYUg9D1w4cMpeW4psjtoUIizmFljbjMowGv4QyUHV9aj+nRuNS4OnK5XpEHiE+qEiR42doe7IRwriibcdF2XBfl31IHYyV0qtcsWHyGbHucqiGbiQga1Y6pYKHQ7KJv94qorVoukIiN4qqvlKGoRbWvnqQ+3VSy/ANu8B/KA2yXWNZBVA/c4TlJt4SKOLEQC2CUYHZ2fZVtc48Gu96a9ujoiFukwTMWpXMLarLzYzbX6hJHo/Gsj4rMQ82QMeaCNUea9Hey0qYZ4fKJhwJfvukA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jjBOR5mo8kgdYVOugH5U//lsSpLwdlYwkkjsZpa+M4=;
 b=G9rzm9Rq7/OdSpLOAmBjK8cEVm8fNiFNzKtEKrm+4QcPqXraFm5P9oS7oE/tkYjN4+69pS2RaPeRjrttR6CCrpU6wtbx3gvs+g7egaO9IcMabICxf598dowB2976NvZYdYWLy231UpAibK0uLaFHIuEU25JCb8k7pJPVtyPdNBbSmt9TeUrDY2hOxwV5TAx1eWGcR050J1fcq6NqGiUeTDW8JKPGu3+29aQBEJn9OWJE4HR/4zuklbdhHWvmX8HDDlYlGuS64rYXvKhD3l+2c5nEMvIwfiioowatF2NVV+csfb6AIPTYOJFiKOIEhjpUFpr6ymEbZf5/8UpkLGPl7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jjBOR5mo8kgdYVOugH5U//lsSpLwdlYwkkjsZpa+M4=;
 b=L26dqFSr2F+P8Aj2puhJVBMKKg5KF70YiFGW+jsqmZuP4ocfyqVwcWdBi9eVOg3rurBoPZHIGZ0AU7NYH9nTYS5MDHs0G6p84iPkhQA3J2cAbr9To7w9QmZWwrV5wiX5Z8Ouob08EKGgBb3RRszMdxg3FO0C4SSfkX5LLtoZ5lWSIM6Vyh5GLm5rRiIJogVVzd4JMsoYvWy3leKBS6lZACD/ngIL0d1ai8t6oRqYEDV3cG1i8HcDNAwpWxvSri/cyK8zJtYUii8gvN/y1KmA2UoTA/RRmZMZ8AApKMi+3C3hySloqMn0Qmwp0mx+CjuTl9OeHE/M2FIFDXBNRDO/Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH0PR12MB8579.namprd12.prod.outlook.com (2603:10b6:610:182::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:55:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 14:55:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 23:55:25 +0900
Message-Id: <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
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
From: "Alexandre Courbot" <acourbot@nvidia.com>
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
In-Reply-To: <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
X-ClientProxiedBy: TY4P286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH0PR12MB8579:EE_
X-MS-Office365-Filtering-Correlation-Id: 7238c089-7c5f-4ecb-e53f-08de7934e9e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	lV69kfqYMdM1QuAwuTTkqxlhOzZBXbbT889GPwZRwEN7Czi2IKA9T2KAlPAfJDkxWFP9XHxUL9N9d+BCgZRtlYUwKD9Oq8M4RmHwsXSZq1jFMjxg8Uq8xVKBt7X/gI6+ozfOiazbBQh/aj+Tcu2JiXM/Kwy9DK5XCVbhs7zxWKElqOrmb5WqEQxlY7wjfn4V19p/F8ggDdzfzoBBQ99oXlzfBcWs1WRMZsbV8BShmdy++m1IUz5cb0Qm1MNXREka9kLLAeddlNWLqryPLdGsb4LobMpjCrPphJLXMke9kSKmVih2rBrwpzNr8szTk+tSlI8MWwG12ugKyM8PeHbJxVAbeUzZtpmq8PQEP5Ku4RKbeN8/mECywm+/B13JeRoByOZruo00ZQekbBYUm56X00YosxBbCapm/FeuS5S9ec+BQ2Td/SeLMBHYC3ukINWbb7AWqnR5bBTXEgel7sNDZMmtM6nIGpNwpr+53UDDnUNCzrbWF0COb25+JTGeQFhe/4hS//KP2cpdt9+bX7JWcmylRRSkUk7ifc4X9JCs9dq1ppkabhrmhXn2IDmMdViOearyVaMoUHs64jTbWEBUIIziqFUZXaCQsxpq5HhkDDH92j4PlcM0RuyXVG9ZUoTvPMa4hS+O8CEFJspetVhtgx47WIGMzVhelfUgyEG+94O52Vp9xfZYtafUPWBy+f8l30LD89IEM9vhIXqB03X22ESMbvw/62aSjzEuEvx2BDk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUQveTYzU0JsZlpCU3VkUE0wSkpERFNtMkpodEp5eS96UVhhRWNUdllaZlhw?=
 =?utf-8?B?cm5jVVBLTWhmV3FTNXNaZ2VaZ2kwdHJkM0cwdlVFUEVVc3BEVkc4L1RONk52?=
 =?utf-8?B?d3VMV2ZIYVhaTlBoRHlqQjI2UklQYVBXemd0aTZkbWFIRmpvT3hxZnJScWJK?=
 =?utf-8?B?cVVsVjJWVFRLM3JyVXN4WE4vY29nakdUQXZvdjJuajVWSWZsTG0xYnAzWVBP?=
 =?utf-8?B?ZS8zMHJHZ0M3QjhhalBwVnQ0c2M1dlJaYi95VkdGWmh1RkgrQzIxU2RxaGhm?=
 =?utf-8?B?U1Ryd3V1QVl1ck40NjBpaXlVZDNJUDdLclZwbUhpY1FZWUVVUEFCRURpR3JV?=
 =?utf-8?B?U3A0VHpXdXA1aGpLdTFjSHE4Wk1qR0UwQUNiS3JkdEFrSysxMnVTUTJTdVMz?=
 =?utf-8?B?ZGRUQmwwb3NxOUQzNzAweC9NOEJDd2N6L1J6bE41aDZpTnRaNXFVOXd1cG5j?=
 =?utf-8?B?QnkwZFRwS3NQS2Jhc3pIN0pZdVA3Szg1aEJKaHNHNkdmYStvL1Q5TVNEcTNk?=
 =?utf-8?B?TlZpUEF1cHlON0Z2Z2Vrc3hSRFpQYytqSVRpdW14Uk5LZXRVZi9uaHpmWmZP?=
 =?utf-8?B?ZFJWNTQxUG9vWDBBeGd6a3puRnd2UGVyZVZJaW03Vk4rQ2xhTXJvbDZFYk95?=
 =?utf-8?B?cDAxZ2FBcXZjYTV5Nm9zbGdxa2ZBakIwbnl1RHJZbys4WGl1MWJ2cml2V0F0?=
 =?utf-8?B?d3crV29HejNIRjhlUmR2QUZhNmR6T0ZIT1M1YlpTOUFOazRsSVBJUldVemYz?=
 =?utf-8?B?SlJ4UVFuelRHWkhSdmh3aXArZDAxa2hmdzQ0TWZnWmZ4Y3h0Q0pvem44Wit0?=
 =?utf-8?B?ZmlEdklKeUlFcFFZNmpTSWJPQnlKdFFFMUdUc2NkVHRTMjZyS01WSXAxb2ti?=
 =?utf-8?B?YmdNUXdFVGlUV2hITmczMElCaTFVeDNtVklkVnRTdDNuWmxhUHBVb3FFdzZ1?=
 =?utf-8?B?WFh3aUJEclFCSVNGNndGVUg0NHB0NllxUk9QMFRra3BrRHBPWndOTmtKMkxx?=
 =?utf-8?B?ODFpVnoyMUxHZnd2V2gwYitFTllHZXRyQllBTnNGQVpMbyt0NEh6N0puWlQ4?=
 =?utf-8?B?dm5mUVVIM2NqNklub0NMdTM4QUR6dlVTSmNUY0ZybmxldzJQRVVDNHN4Q0dG?=
 =?utf-8?B?N1pYeGF6N0hyU2pBZXhNNlZjMFlrV3VoOEpPOXFNWXNsY0NUY09TVFo0R3lx?=
 =?utf-8?B?ZVUxTUVCdGQvVlZ5d0ZpVG5vNjJjdCt2UXFRRVdiMzEwYUZzaFFldWdJZllR?=
 =?utf-8?B?ZGl0WHR5aDI3aUsvWXJmZ3AxdllKbUk0ZG9vVUZycURROGdpSTZ2OVpnNW5V?=
 =?utf-8?B?MDNiM0NITG9NOGhMNWxFT0JnSnV1c0M3MGkyU2x1cm1aZjBaS3lFSS8rajJT?=
 =?utf-8?B?Z3lpa3B2YmVNU2hRV0wxa3hSdVB0bWZtdkZlVlZVNmxkbEppZzc1aVdoMi9n?=
 =?utf-8?B?MTNzZWhwNUQ1UGZJa1pUYzl5YUdQWm9Gd1k2Mmd4d0tYdjNPdmdrSnpOVVd2?=
 =?utf-8?B?N2d4Ulp0aUZrRFAzT3VDRGFQNzN6cXNQbmxJYlV6aHJBWDBZeTdzSkhFZmNK?=
 =?utf-8?B?TlM0RGNvbk5ZbmtmdzFIT3lGZmJRTTVDV213WW1Sa01WY25EeWtkU015b1pQ?=
 =?utf-8?B?QnlaT0ZRR2NucC9iSmcwendxWGgxU2pvNTJ1T1hoSDQvNmR3aFJEeVpia0E4?=
 =?utf-8?B?VU4zZ0hGOENIczhIZFgyRGdlZW91K2lLdG93Q25MaWZjQ1Exc0pXNHVodmli?=
 =?utf-8?B?UlJ0RDFEd3YvejRPeDRNUVJVaWg3UWtCWGJDYVJ5bS90R1paNUpNTzdiUE5N?=
 =?utf-8?B?VFpDZ0plU3lTM284cDd2bDhwSjN0RXZsZlFDM3JPeXE1MCsrbjIzaDFoR0t4?=
 =?utf-8?B?WW1Jd0x1R3k3aFR5bWRtUFZMd2dhN2liK3pLbHI5UG81MUYwSXJ6WkFsRmJi?=
 =?utf-8?B?UElpVzlxMkZQRkNyMk1pWGdmUm9lT05UL2RIN0lXMFVQWkE2emV6aC9zZ2RP?=
 =?utf-8?B?V1pIN1A5UlNtL1Q3UTdaNnpDU1UxYndsWDBoTVoyS0YzYTNnblBXN3M3c2c1?=
 =?utf-8?B?U09JcXI5VW1aQ2xjRWVoKzcvNVc5R25BVEVnYWdvOHZLOTE0T1dSelJiVzBP?=
 =?utf-8?B?OEpFNXZSaks5eElNRkpYSHNpbHN3VE5IZDJZc2lMNHFYZmRWKzE1V3lUNUxB?=
 =?utf-8?B?bWUzaFpPbW1JZUJwRWhud2NnekV4bFVzbWtyczRNV0F3UnpNNGZESjJzNFVE?=
 =?utf-8?B?TmwxVkp3MjV2M2w5bXlndm80OGtqVTNrdER6d3BmZWNZdzE1enJqRFJOMjUy?=
 =?utf-8?B?dkc2SmZCQWszcVc3YTNHU0ZkVUNLQi9Eb0lDdFNBckxqNnB1dkRLWFBYajJl?=
 =?utf-8?Q?KE/WoxU4DoxIfSGCOj7S6vKbgzUorZHb4I6QiziYEIfE1?=
X-MS-Exchange-AntiSpam-MessageData-1: wYi8moQH94emrg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7238c089-7c5f-4ecb-e53f-08de7934e9e1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:55:30.5135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FD4Kk0FZeYH+4r6v9Aw/tDO2orpTTAZ6TStYygrjIAQZd/qt46LQ8dG1UKyZQj7h6fjq5F2+Z/Hbg8Lb41B9bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8579

On Tue Mar 3, 2026 at 5:31 PM JST, Alexandre Courbot wrote:
> On Tue Mar 3, 2026 at 5:14 PM JST, Alexandre Courbot wrote:
>> On Mon Mar 2, 2026 at 10:39 PM JST, Gary Guo wrote:
>>> On Mon Mar 2, 2026 at 1:12 PM GMT, Danilo Krummrich wrote:
>>>> On Mon Mar 2, 2026 at 1:53 PM CET, Gary Guo wrote:
>>>>> On Mon Mar 2, 2026 at 1:44 AM GMT, Alexandre Courbot wrote:
>>>>>> That should be doable. Note that we currently support `zeroed` and
>>>>>> `default` as initializers, so having the same level of coverage woul=
d
>>>>>> require two `write` variants. I'd like to hear what Danilo thinks.
>>>>>
>>>>> I wonder if just providing a single version that starts with
>>>>> `Default::default()` should be sufficient? For most users, zeroed ver=
sion is the
>>>>> default version anyway. For those where default is not zero, it perha=
ps makes
>>>>> more sense to start with default anyway; if explicitly zeroing is nee=
ded they
>>>>> can always do an explicit `::zeroed()`.
>>>>
>>>> I was thinking about this for a while and also thought that we probabl=
y only
>>>> ever need a version that starts with Default::default().
>>>>
>>>> What I still dislike is that the common case becomes write_with() inst=
ead of
>>>> just write(). (Just to clarify, the name write_with() is perfectly fin=
e for what
>>>> the function does, it's more that we need it in the first place.)
>>>>
>>>> Also, IIUC, if the value is not created within the closure, we'd still=
 have the
>>>> following redundancy, right?
>>>>
>>>> 	let reg =3D regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>()
>>>> 		.try_init(|r| r.try_with_offs(load_offsets.dst_start + pos))?;
>>>>
>>>> 	bar.write(regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(), reg);
>>>>
>>>> It's just that this case nicely converts to write_with().
>>>
>>> You would have
>>>
>>>     let reg =3D regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
>>>         .try_with_offs(load_offsets.dst_start + pos))?;
>>>
>>>     bar.write(regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(), reg);
>>>
>>> Note that the `default()` invocation doesn't mention relative base, as =
it's just
>>> plain bitfields without offset at that point. [ I like the fact that th=
is
>>> doesn't need to use closure, as I generally prefer code without them, p=
erhaps I
>>> am not "rusty" enough :) ]
>>>
>>> In my view, if the code is complex enough that you have
>>>
>>>     let reg =3D ...;
>>>     <some code>
>>>     bar.write(reg)
>>>
>>> then it probably makes sense to have register name mentioned again (thi=
s is
>>> typed checked anyway so you don't need to worry about misnaming it). Ot=
herwise,
>>> one might read the code and be confused about what register is being wr=
itten to
>>> at all.
>>>
>>> I think for explicit location parameter makes much more sense for relat=
ive
>>> addressed registers and register arrays.
>>
>> I am not too worried either about having to repeat the location in a
>> write if we needed to store the register value somewhere first. That
>> case should be covered by `update`/`try_update` anyway. What is less
>> acceptable imo is having to type the location twice in the same `write`
>> statement.
>>
>> I spent the day testing different strategies to support the
>> two-arguments write with both explicit values and closures to create a
>> value from scratch. That included adding a trait to produce the value
>> and making `write` generic against it: if both immediate values and
>> closures implement the trait, that should work I thought. Except that in
>> the call site the compiler is unable to infer the closure's argument and
>> requires us to explicitly specify it - sending us back to square 1.
>> again.
>>
>> Another strategy is to make `write` accept only closures, and implement
>> `FnOnce` on immediate values... but that requires the `fn_traits`
>> unstable feature.
>>
>> So that really leaves us with two options:
>>
>> - The current one-argument design based on `IoWrite`, which carries a
>>   location and its value,
>> - Or a pair of `write`/`write_with` methods for immediate values and
>>   closures, respectively.
>>
>> I'm ok with either, but the first one looks more composable to me. I can
>> send a version implementing the second one if people want to see what it
>> would look like.
>
> Mmm looking closer at the two-methods alternative, it does look more
> familiar in terms of Rust patterns and less hacky in the end (i.e. no
> need for `IoWrite`). The drawbacks are also manageable. I'm torn.

So, to get a better idea of these two options I have converted this
patchset to use the 2-arguments `write_with` method. Here is the
difference between the two - it is particularly interesting to see how
nova-core changes:

https://github.com/Gnurou/linux/compare/register_1arg..Gnurou:linux:registe=
r_2args

The two-arguments version often results in *shorter* write statements
for multi-line statements. One-liners are interestingly the same length.
I haven't found any instance where I had to write the register location
an extra time.

Note that the `Map` trick to allow closures to return a `Result` is not
implemented yet, so there are a couple of `unwrap`s to allow the code to
build.

One detail: when using `write_with`, it is more natural to specify the
location first, and closure second, since the closure's argument is
derived from the location. However, all the `write*` methods of `Io` use
the `(value, location)` order. This introduces some dissonance in the
API, unless we convert everyone to the `(location, value)` order.
