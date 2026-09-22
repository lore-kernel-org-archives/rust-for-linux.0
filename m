Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010022.outbound.protection.outlook.com [52.101.56.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1282E3EFD07;
	Tue, 22 Sep 2026 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084381; cv=fail; b=Vy7HoMmQyrIXhQK3Qbd8BKX4XKmJY0a+XB7N2SUDhvifcF6Lxi83vdiuNx92dyUtSSZBtnEzD5Z6Oaf2KU9pRvDs7d8FQPJluKjEkA8YaSIuAqNm/ZmdIIQm/VodF53qY6wF5iDniRPUBBcrMMS2HUN4KvRo4LCbYhEUuJ9sqNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084381; c=relaxed/simple;
	bh=xcZFJ6M87UpGLcOAEXPvBcsp1JbhPToIvdLitlbZr7Y=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=GyCWVskkN/yja3iCtPc9PyYhGSQesfkus5oUshHvkc8wSDiUH2orQrnkVsMWu1Zh10xPUo1n6c54pkxTb3lwdoSIANnSc+KHPe5rzZSMV7Odo1/hxP8jofFy/6Vq0jI9jZ95dKxifkc+W/CUzwbqI88XrIGPTZi2nNR4I+mb5rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s/ssw2GC; arc=fail smtp.client-ip=52.101.56.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s/ssw2GC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSzK2Qx2si0QsGDOR+qtTbUiWGPNlbYjexp06Z9jTdA/GzUsxJsMKLgfGJYkEVZ7vwKCbHYI3PIxTp0NkUuktrbrLveb/judl/HKOSMuJ1kEa2pKcuXGliKPfc3JELm0vJVWHWX93IyIsT33Sakr/w/PIwB4kqMVrDGSvpTvBps1gxO6yOsA3Ao6oMfIhA0gIlADOujhdmwRwNZ1hDPDcFtU421iBm6KMbFZfhjtYU/I9CM3LS/XlwYcYrrHcrFm/8FVVWnEpvE0tAbXpSJaFQq3+hK87eVZh+XcET2ntLBPehEBiEI7vcQWgV0cFwxAfbttHaCUFH/cIO2As/XLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SifaIqBZgYQqq7msNTW7PYoB1FJfN92f/TU/6kEfNrU=;
 b=m/2k1W/+AbOh1aRCUzf/ppfDCKcyuaWfyVVHHUCL0eukUOmJujJNZRu6verSdzdWNWIEkjZSmjqSMRk3eau854u4s9zc1iGPqi5445uDLueXGMVH3VM0AvmcXiCH3E/A4/fXsF/AhXOP6QQMNwJwMtVse7p8/2fWt9lD9SxuFz40G+b61f75Tz4iULOCEFOXmrNAS6C5RB+SJGXbW0uJ+Pww//hpZXD5ZudNmVEekwdI8nb6psPzqSR7qF02y/FBZE0zuqYrCRmxnbFYqxq7W8MjIrTW2n0QNLFpaHPNje1PXL+YaSpW5CfIMc6gcvnrVU+7GMTo/DzYLaVkya4iSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SifaIqBZgYQqq7msNTW7PYoB1FJfN92f/TU/6kEfNrU=;
 b=s/ssw2GCu2KxnsdAofu5LP9R/d+X1RGd0LhHYvZQFD8a4bSZnhEvX5P1ZwKrGqENBcaWrluMnDq+anR0ybQS2m2B3+ijg6XkHF3OUHwMp/Nds3n8v3lQO9nN4pzBswHkjHFbsgEA+3I1YHCv6ITArVIwH5RfFH4axazN8Y1OZaCU1dux7bSrYs6izADDpZLbIvYSEVm8ZlflU6/jm03/JX2fXHBF+S+hvQ/D0q2X3ebV5tSn1QJKBDFy5uT+v7pPycX6ttr2YGzEJeeK9QEuBpv5872E3HbqSNCLZFwQk9Wx3QQyguKeSjuaIvRzUB93m9DGHogwqH7FGTHJGcroAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB6896.namprd12.prod.outlook.com (2603:10b6:806:24f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 13:39:35 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 13:39:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 22:39:31 +0900
Message-Id: <DLLVY7G20JJA.2B0KTTODUU9FG@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Yilin Chen" <1479826151@qq.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <yury.norov@gmail.com>, <ojeda@kernel.org>
Subject: Re: [PATCH] rust: bitfield: require Zeroable storage for Zeroable
 impl
References: <tencent_AA30574AC78ECFD88D7E042A49371119ED08@qq.com>
 <DLEFXN8E20PU.3GJN24VECD90Z@garyguo.net>
 <tencent_BECF7D8D0F045D49DE115EED535736C7EB08@qq.com>
 <DLKT85RM6XFH.1FHCL3Q40L1I7@nvidia.com>
 <DLKWS377R3K0.1XFDX36YZWRQU@garyguo.net>
In-Reply-To: <DLKWS377R3K0.1XFDX36YZWRQU@garyguo.net>
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA1PR12MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f421b5e-8f9d-4df4-03be-08df18aef01e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	L/lYwe4ZD3aqcgLBA+VQGlD/CX/mbXE7VeiJdBOE3UbJ4XFocxfyH+cbLcRPaKgTt0ah+JjBMvM159lXaeh+xpj8glFgaC2jbXMb7f+siiNZtZ1l+oez1tiB9YGzrdrb/UQe7WSf3Csdfwsb/jqWS5mKVlji/vdKqOJMSF49J7UU/L7jV4st69BmQ0l7Q7Q6D1f3hnhUghTTT3rTPiW0m+DZ/cQbIcFZ3tqVYbtz775s1zQnYxAQMGpdzi4meHpu/Pd+f8NauHWWNgxETi9h5djehGaPPCMVCrlv0iI12H+j1OhBO550/pvn5TYcZCjBJLL9IAFWPR1NroMy9Onu7sNrLt+EklI5H5g5+VLdnapeFVQ7mBFVPMNnBXTgL1GmYrcEaEE/HzggITGFgCzqQEoVMsRBUdvbcrtvLKRhkk1VrZsG9yVMmpyO4LwaRchqi3L0C29cPoYhXo2ZE6V1wpKhylruw+10jWr4Q/mdFoDzgW8WoFweqwVfleJuxgDalZieK3/fnxrcGpU+/B2TYWdpik0QK3WcBzai1JQVmm38JWVtpwYuk3ZxWyHwvvWvu0j2shZDSySnj0nTyH3mKe0u0fANg1bmbI7k+aPiU0Wyq5v7hq0Vnoq3Ag+GW6p+CEzYJszXufdg69iG1x7Ol9qIMOhAEvzHfdfTgiNB8Wk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE5Ba0RpcVQ1cmNacXBNUXo3OUhFYlpWVXFnNW4yeEp3YWNIdndUdnVHejA0?=
 =?utf-8?B?OHY2ZDFaYzNtUi9ZbGlWbXMrWjVaeWNxUjMvdVFwQ2plNnpORjVqY0w4YnZh?=
 =?utf-8?B?Z0l0L3ZyUDVhUWpSVC9XYnpXeE5tZXlIU3piR2NReEJjd1duZFlQR21qZ2VI?=
 =?utf-8?B?N1VHYVlNeGR5S1VDM1BlTnllMlNSRUJPSVlHR1FBakgzaER4bHJVWUpseHdE?=
 =?utf-8?B?QSs0bXRuenk2OUM1TGhrR2RnRXV2Y3hrUmNnZXpBbm9TSkZKM3lRcUFHSEV3?=
 =?utf-8?B?bFNrUjdyZnkzMDFLR2hRQlVhRDFFU2h3Um9uOTdLVVp3dVhTS2IrZnVYUi9h?=
 =?utf-8?B?aHVET1cxYXB0bmc5Z241YnZzem1rYmRNZ0VlYnhuOTNmNEFRZllxVE5pVGRP?=
 =?utf-8?B?N0Q2YnR4SmZYUlJueW13UXM0VFBKZUNPTUYrK2NJQmM3OGwzVEdRVk85dGlG?=
 =?utf-8?B?eG5CZHhJSGdyVTcrWGZscTJzYTdjWlRrb1k0VkNtVkF6dVFVWG1PblFiNVNW?=
 =?utf-8?B?ZENtMWtIeDZaTWxXVHFtNHdkVjVUL0QyUWQxNFMxOE9TR2FBR2VERmxJbkNa?=
 =?utf-8?B?SGVMYU15TEVNSVk2QityNk1nbjk5RGVUaGpJeXoxeFRTNitMOXA3NUtUcm5G?=
 =?utf-8?B?dmh3cUlxckpXRmwxUVNQUjBVOXNZbjllOFNvRy8yNXlhU0g0QmJZZ1AyaUVQ?=
 =?utf-8?B?YzRMRjE0WUFVWS9DYjJmVFZOenRzN0xqMjFxWUZNVUE5TGQwYnpoekQxcXhr?=
 =?utf-8?B?RS91S2tEZG9oU0pJMktxd3lXcTIrcEJpRUxkUzBHbTcvWUp2cGlqL2pCQjYz?=
 =?utf-8?B?dnk1RU15MDd4VnNVRG0vMlozRnJEdUZUTHliYzh1Zk9DSWRoNURTQWtjNWJE?=
 =?utf-8?B?NmVHaXAzR0VmdFlxMnFWbG1uWGFQRExoL2p1OTVleEJVanA5YnNIdElxUFcz?=
 =?utf-8?B?aDRjdjMrVGVGSlhZSFUzdUZNS0VLeWZ2Q1ROYmwvZzV4VnZaQ1FPcjNmbnZt?=
 =?utf-8?B?bnRpdkg3eUsvcEtwdEt4bEs4NjhvZjdVTG5vU2ZzTHdPZlFJVE41cDBGTjli?=
 =?utf-8?B?WUxhV0FmSmpPQ1kwSHArVHkxc0hLRVNueDkxWjNoS0FQTWZsZG5hSjRHV0Yy?=
 =?utf-8?B?cC9YbEx5RFc3b0k3ZGlLeHNSV3Ixa0E0WkR4T0dBeUYwQmVkbjRVMWFBZDVl?=
 =?utf-8?B?NTVka3VPNjd4ek9lbyt2S2JzRVVVdTIxZnpmT3FmT2ZaVll3U0JBM3dWcHdB?=
 =?utf-8?B?M0lheG94bDR1aEdDY0ovaVdPeG5mK3ExdWt1Nlg2dUxsSG1FR1BjSUdPV3dO?=
 =?utf-8?B?VEQ0TEp3NUExbkNBQW9zb002aGdpejk4dG05bnRYZHIyR1hNeDN2ZGNqbUFO?=
 =?utf-8?B?TjJEZFpmMEFCQ2dpZ1ZBeVdiTTJpL3BiVzZVU0lzK2xKUFQ2ZHY1Wm9oZFlG?=
 =?utf-8?B?c1ZTTEJkZTdTMTFKYlBDN2tGWmlOS0RmeUhKdFpLbnRVQVl6VDhxKyszRFpH?=
 =?utf-8?B?bElvaWRHZUhuMTE3TVVhUWFvTFA4VCtwOG9LbVZ2K08yeGdnbkxGeFNyMDE1?=
 =?utf-8?B?em5hcTdtL29UakFyeU1LRVVRNlQ1WlNjZHpoZGdCNFNwWmVQbENQQjdWTjRQ?=
 =?utf-8?B?eCsvamNhZk9FemhuOExwN1YvaUUvT0VKcXQySkIycFZBdkRDb2p6UGZkSkxD?=
 =?utf-8?B?b21FdER6RHY4ODZRWWZtTFJ6UDRTNlhveWU1SG9XRk11QU9ONnE4eGxVN1FC?=
 =?utf-8?B?TWpLdzBLTzFucGFoNDdaZWVuWkEzQTQ3a0hybmxzRTVDVEtCWS90aGZ6ZEN2?=
 =?utf-8?B?T1pSTzRFOUtETTBxbjVqY0FJMnYvOG5OOGV2djNubklyNFNjRTFLb0lyQlYx?=
 =?utf-8?B?eXl2TGJiVjF1My9Xc3VCWmJMVG9jVTFHSXBsQmVOS1M3NjFWL05jMGdZK2x3?=
 =?utf-8?B?N2p3S2RZMjBmMDh3UUFpUjBrNFlYd0JHMlhWdXlxbEZRUldoSnRtVE0rcFlJ?=
 =?utf-8?B?bmduN3JVcHdpYm02RDhBU2RVTDQzNnVZQmRxQWhyMHdiZ1dWdnZlWW1LeDJ1?=
 =?utf-8?B?YVNUR0E3OEtkZ1REanpTZmZEczBucklBM3loTUhpR3MzelJMOGtRSUxHUTFW?=
 =?utf-8?B?SHloeDY0b3VTNVJDWW1URlJTcTBGQTBEdUJTUVpHWVpYNUVBSnUzWmF2RFNG?=
 =?utf-8?B?Y3A4SU95blp1aEJoM3V4ZDlCOEFJVTdRK21TcXRlcmd4dGlhYTloNlduUGRv?=
 =?utf-8?B?cVVIak5OUDB3TTFuWnp4Mng3d3p1UE5PSmxPUU5Xa0FPbitJSzRXRFhaRVI4?=
 =?utf-8?B?VlZuMWtiYkdlcmUzcUdEd3h3Z2Q0UkhGQ3ZPQlVsTTJ5emdUZE1LWnc0enhR?=
 =?utf-8?Q?3/XTqHempkSEZCjiohyWOs7S+aBS1TEQCF5MwbPe7I16f?=
X-MS-Exchange-AntiSpam-MessageData-1: 6/vB2qgkuJl2wg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f421b5e-8f9d-4df4-03be-08df18aef01e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 13:39:34.6387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTWqowIOz+35K9KFGtitpKzs+tmQdrX3ldMnHmIGvDNOZburMRWGPXkvX4sRngFyoGTr2EPzlDPdYkJS3CCVXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6896

On Mon Sep 21, 2026 at 7:05 PM JST, Gary Guo wrote:
> On Mon Sep 21, 2026 at 8:18 AM BST, Alexandre Courbot wrote:
>> On Mon Sep 21, 2026 at 3:32 PM JST, Yilin Chen wrote:
>>> Hi Gary,
>>>
>>> Resending my reply for visibility on the mailing list.
>>>
>>> You are right that a bitfield with at least one field generates a use o=
f
>>> `Bounded<$storage, ...>`, which requires the storage type to implement
>>> `Integer`. However, `bitfield!` also accepts an empty field list. In th=
at
>>> case, no `Bounded` use is generated, so the `Integer` requirement is
>>> absent, while the macro still generates the unconditional `Zeroable`
>>> implementation.
>>>
>>> For example:
>>>
>>>     use core::num::NonZeroU32;
>>>     use pin_init::Zeroable;
>>>
>>>     bitfield! {
>>>         struct Bad(NonZeroU32) {}
>>>     }
>>>
>>>     fn check_bad_zeroable() {
>>>         let _: Bad =3D <Bad as Zeroable>::zeroed();
>>>     }
>>>
>>> This currently compiles.
>>
>> No it doesn't.
>>
>> error[E0277]: the trait bound `core::num::NonZero<u32>: kernel::mem::AsR=
epr` is not satisfied
>> 364 | /         bitfield! {
>> 365 | |             struct Bad(NonZeroU32) {}
>> 366 | |         }
>>     | |_________^ the trait `kernel::mem::AsRepr` is not implemented for=
 `core::num::NonZero<u32>`
>
> On the other hand, it makes sense for `NonZero<u32>` to implement
> `AsRepr<Repr =3D u32>`. So I think we do need better defense.
>
> Given that fundamental `bitfield!` needs a plain integer type, I don't th=
ink we
> want a `Zeroable` bound, but rather just enforce it has to be integer
> primitives.
>
> Given the recent `Integer` sealing, ad a check that $storage implements
> `Integer` is probably the best check.

That, or we only derive `Zeroable` on a bitfield if its storage type
also implements `Zeroable`.

... but that possibly leaves other ways in which the invariant for
`NonZero` would not be enforced, and I don't see the point for a
bitfield to be backed by anything but a primitive type, so maybe
limiting storage to implementors of `Integer` is the right move indeed.

Yilin, do you want to send a patch for this?
