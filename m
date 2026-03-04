Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012069.outbound.protection.outlook.com [40.107.209.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2300D3D1CC3;
	Wed,  4 Mar 2026 19:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772651967; cv=fail; b=slHHgljlwWH8wRxd/qBMZrLsc47TN4cdNUPNoX5OhVr3wipRszugmgMk8gbEGZnHyTFKVUw3+HkUDhE/9gki9/eTsJ2Ve3MawLufR5VZ5sueESW29qEI2KqT6tE8jK+06JvvxVR+TrWeL6o92AgDUerFxfKMYy8Fmt3cRQaYRa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772651967; c=relaxed/simple;
	bh=6ux+Ns/EUsFyMWiDNXiMLCg0S+ShIFztBYU5IMkw+FQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bqy8uxa8lFBTeDrZQc2GIpc6f7FtgbQlCKkpclZjDdIUtBYm1mvd0D0y32+CNoOewJUPR1MzMgkca/U7UcVi6B1TsaED/wzerxAFVaZ5oUJ36F8vf2rWomhHwtXl6A9VFGk+izPIv59eFcVI+15SnvQdzlNmklkOZgkyTJ2un8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IAb+zNy+; arc=fail smtp.client-ip=40.107.209.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IAb+zNy+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sntFSfX1z0IpUT54mkZv/Qi3Rl1mfSdwXOjKk9xTcRZHc7FOB86JbUd9ULoh8L3/0USxt/wDvtMEe+XfIApjB+2lTyW6mlXgFF66+VLUOhj7JkIhvulBgiLfHDzfjxN+MiLv/oVq5l/bOtmJJpp0PF/drZhWWnXgadWl3Dji42NGCZnQYhZlmOQ+DQnICmZcZMtxCLwqqA2n/2lPcOaBgYWtgvhCO+a5vvwagAbrB3UDd8PZU3KsJOgSpydKsWB8tWYS7lUCiRFFGufGKnduAWGvn7paKhgAd3If5jzX1eu1HHWvcT4eiEQeMhIM/NzrtM7VaIg78/83wlJgiSxnuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJyal9hwYx/dG9s2m9PEo1VvWhEmQPSJsn7JDmgC2QM=;
 b=JQhJ8kYWbOZXbcqcSNhVfIwXB7WL090c+HEQGWh2KbuMiPDieeeeJiBKo0a7KtjDDGZ1lds6e8QMtfVZYvcIsk9nT87ATGc1uKe8OAjpM2nSIjyc+zzOHPwne3/1F0sT6EHOuYd3mZfkldSo68QRJ4LZafdigrDAS6ZItUtt2IMOXDWPqV4p++zvHpE2+zhnn0rFJpy9GeuNDJCPAdG/y/FbSfnxB60vFSHTOqvAhstxJ/bomseAkknQdYcpEJ9wQUYT0yEXs1jqNfoQAYzxVFYKTgLNJsMv9xYtuSG04kXOkleEKGhq5AxRkotA9WUUVulQUAJ8/Z+I9DZozUBYEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJyal9hwYx/dG9s2m9PEo1VvWhEmQPSJsn7JDmgC2QM=;
 b=IAb+zNy+ChcRUfk2DiRMiFQad/jGvtohDtYP+Z/dA8igZB2nLCx9DSzBVZpjaHShPCE6e669dvUYJDH/8C/l0E8A/Mw+1S1I9ZzSGrgNJ8/L45dxbWJV51QlABfD/wxx0xTEUB3srSCDdTekpCEIPMNe46ijbSCEfBdo6Kj1FDCSLfpTs2ZaUBNHXkYPv4d1mpfY+FBNBk5XiWfKZCNOqfqyIEntZCtjGsZWHcS1BAm/nbr8P/TZVx4Jmzus8VGJSMV8+OPqeKxjg0jZ8sC3yLImT5bM5bUsGQ4QvRBWv+qNbEh1Dp8dDqu1A2kcf/J4BW8rmcU9b+edTQBUZgGHvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Wed, 4 Mar 2026 19:19:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 19:19:20 +0000
Message-ID: <5e281d9c-20e0-47e1-8635-e062f18d47ff@nvidia.com>
Date: Wed, 4 Mar 2026 11:19:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Boqun Feng <boqun@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
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
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
 <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
 <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY5PR12MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: f053f428-7d8f-4091-8539-08de7a22ef5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	+Os4utQg28/7yUz1GE78BAjXQ3JBh70BzYbLBxj0vprFvCbvfz/IBRA/E1C6q6rhOswX2epdOmWh1TH7BgQdEX8JcmlHm+R775k9J2QOVZ1k9iFC350O0O59XzdwWbI99QsZp1QIajl+dz+nVZZ1eeFjjSKV09Ee9HrdVHCrtnhX8bSyBMWsG7o0pvMn20Gabboe28H5ykb4hqMnATExS7FBruHogslw+3DDdN/b1piK8IihaOOzHDtvPZmghPqmZDCYSxbJivNi9EyX+nbzITtQmn8/V6S0C0ZpLH4q2RoUglbuU3vIWNupV45SB2MqInbGWDDz5KO1AXO6Ve+tRjgSeAqRlG69vtAkfGBkp3YWKhUqlgV6I3Wquef2bE7AGIbpcm2CMhnV7HFfwy4JzXMJi01CaZLtHfalQQtUJqxGbrT4EnT4Fi/fXFmYRoohM+kRE4QVgmkS58x0QxAVCbF2/tNpQKXJdStrvEYlAJ0X0xiinhWiE7+dgui/2CBZI7kCTPh4XFkjDY39lEoTyHrNqUGkkPryS/QcEk+/ErMYc351UOO7IG9R+tcv0Lzteuo4FV4RIqQ0FyJzwOpxS8zAMtpJtVQbjYO9KcHRj02IY+k7KYSc1KHFp45W3F7CsjdT7pvxsN50jU2v3pHjJds3pP1SARkKDub0ka/f0VqLZ4m/v8m0MPutsStJTUVFIHgOz87RV3cCUnqMxscNw7eSMtzdYR2F2otHjzxBT5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEtwNXVSZFpOUTdWMzJBeDlWWWl3TDRlOHROSTRZS3FVU1lRWEptQXUySG94?=
 =?utf-8?B?ZElHV2JrWDIxdVI4Q1Z3MWtjZ0p6SWE0cFdxcHQ1Y1Z1ZGNacTQvK2RZYWZa?=
 =?utf-8?B?UmtFRDZleGUrVFBGc09CTzZraVI5dVZFeEpLWGFyMU5OWnJxU2JSc1dsRHFO?=
 =?utf-8?B?UkhuWTVRVmw1QUpuWVVmMGVibVo3eUc2Tll5R3NoYmZRMzhubWJsdFVDR2Ew?=
 =?utf-8?B?N3RoZzQ5Nnh6a2F6djk2ellQUUJ1a2VkaHBuMjd5eWZUb2d4dVlSdjZaWU8x?=
 =?utf-8?B?bkk3ZE84NWl2VHVGbVZrc3NQTHhQOFhvTUlEeDhpUTVONWdVU3hlMnJSNDJq?=
 =?utf-8?B?WW1xUEV1RjYyV1dhTGVpRERLc3d1cnorSGNjWlp5cWZ3MWgwc295M1dDMWFh?=
 =?utf-8?B?UEUxdTNOUGwvTXdxYTlZTEw0VXJ1elgrajR2RmVTSWtoZnpDK0lYdmVQay9s?=
 =?utf-8?B?NzAvRjdUaXVGMFZJZTlUa2l2Nm0ySDlBQ2NlM283ZFhOUVJWc2ZBdENCbXRr?=
 =?utf-8?B?NUo4QndhTXRyTmpISHNCa1BZT0N5Y0dNRjJFMTZGYzFFR0FHQzU3U09Wd2RP?=
 =?utf-8?B?WGcyK2NQQW9jc2E4NFpGalVoMUZzRWo2UERaeHR4UzdndUtCVkh0WXpIcGlv?=
 =?utf-8?B?YlludGpGTnRsR0NGU0Zkcms5UGlJRENaZEYzMVlZRU9OZyt3bmxVVndtb1Fy?=
 =?utf-8?B?YUxGcUZUN3dEV3JYcU1PNjNsOEExRHFxdURvVzBTbStzbVJkd2poak9hRElv?=
 =?utf-8?B?ZU4wV2IxdWhLQmVrSDFSZEx2L1BRMGRHV3cxZ1F1YUNIQ0FuODF1ZzFLVG9l?=
 =?utf-8?B?MC9qVHZSNVpCd2NKSEhtOG0xU0gzY2JlOFNCdHhZdlpFakVZYis3MVZEV0VN?=
 =?utf-8?B?OFdqQW1vME1ya3phd3BmcHBJQ1NjRCtxUUR6aFNMUHcvRy9rYzJONHc1TVRH?=
 =?utf-8?B?YzRZMmZYdVIzVXhwemFHSlowVWFRR2ZmOUlrREFLTW1PUjg1NUNFd0lFVXp1?=
 =?utf-8?B?Z3lZdXVINUp1OXFyWGthWCtUK01MN0dRVDNkMWx4Ymd4RTJWWHBQUWF5UVlF?=
 =?utf-8?B?a0lGSGM3MURiV1pTTWd6eS9PQ2VWdEpCcW4veFVxSHd5VE1XOVBYSDRjaVM1?=
 =?utf-8?B?ajYzRmJDdjVhdksvY1lpbVRkT09UZ0dQL1ZJejh6NjZFUWFKMDZJeUNiRTlQ?=
 =?utf-8?B?YXlSdFdPZTF3aUgyeUdNMmFaWng4TVNaZXRGUkI1blZlcWlLRjZlREloak9i?=
 =?utf-8?B?REF0eExqZjJ4ZlJ3TmJieDVCUmN1Q25Tclk0cWVIZzFxdHlQQmkyZFZhWFd5?=
 =?utf-8?B?WmlqbzZlSnNDMFgySnBBcGxjQ3NDWHdMb1pnYWxsbjlKNUpZV09ObmJMQi9Q?=
 =?utf-8?B?Q2RPUFFVYUUxTnBDSDZRK2Y1c3o2eWtzUnZFRHVEcllqdmJFN2cvQXNXV2lu?=
 =?utf-8?B?UjhlWUFHcXBFQ3gyaEd5azRyR2JRTWtYR0FZUzAwM3JKdVpzWGNEY2hJbmFD?=
 =?utf-8?B?aHI1NXZTUkVBZVVjd3NqTHdNVXJNUk5vaEttSzMrRW1QU015WDZPNmdiRmFn?=
 =?utf-8?B?QVFGeVgzbmcxOHowNnhFNE9CL1U5d1VZRHZhL3R1OHFOdE05K2k3QXZ4RG5w?=
 =?utf-8?B?cTluSURCSXo3VVBkOVZkS1hBTy9LNU10TWJxZ1plWlcyVWdhNEpQdVpqb1dk?=
 =?utf-8?B?S3ozUDE4M05TUWV6QTY1QXNnTUwvbW9Fd3htdXk3SlhRdWdGbHg2R016Smhu?=
 =?utf-8?B?c2hOZXZzMzE0bW5sbi8zSDZmMkI4RnJCTDN6alZITGdzeC9Va0laZm10Z1d2?=
 =?utf-8?B?cTgyaHVCMmtsTktrNjVwTElXT0lPMDZ1MjRZSkh0ZjBHc2kzdTVqR0pWaDVx?=
 =?utf-8?B?TGRHVlJpNTRLVnZ2dlhsWDlHcCt3Q0pCaGZ4eGF2Q1JoMU1Vak8zVGhGYVBi?=
 =?utf-8?B?dFhhelh1MjVvdVRSNXpJQmFtUTdWa2FaMmVlYUhFTWlGcVFDOVV5dDY4cFRh?=
 =?utf-8?B?d0ZYVUJ6RFl5K0NKa2R0V2taUHhlbGNVOExhUzY2eHF5ZmpiT21YK1FHbFc5?=
 =?utf-8?B?OElWcUFnaHplVVM1TFZGTmIwN0lmZGFLc3lIYUtqTmI2dEpwSmx5Z3ZoeGp5?=
 =?utf-8?B?Z1VZd1pZYmg4d1B3YUR0Z0xCS1RIM2JBWU1RMEJDbWlnMk0rWmlUNzBnYUs3?=
 =?utf-8?B?TStoK09nOUVPSXNib3R1Y3JnZGdpNU5SWC9UaE9IRFJ5N1BBbWFleXg5WG9H?=
 =?utf-8?B?ejUxMitwRzJ1clpSSE4ydTAvYzlzOWVEQ3RTRXdSSDBlQXdTSGwrKzN4RHlK?=
 =?utf-8?B?a2ZLai8vclQyKzd1eWlkYTRGQ3NhckM4bEtZZ2FCSFozTUZaVVZlQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f053f428-7d8f-4091-8539-08de7a22ef5d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:19:19.9086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zJjIgso8gLHQxO+nmC2n7GDxojzRH0yB/1pRrCqBoCftWCvvHFBL70moyCum11tvqBLhltYCHO+n9zLOylQag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6083

On 3/4/26 10:58 AM, Gary Guo wrote:
...
>> I see no reason why register values for different locations have to be distinct
>> in terms of value types.
>>
>> Even Nova today has quite a few registers that are just bitfields of a single
>> field that spans all bits. I think many simple driver would probably want to
>> just operate on primitives for these.
> 
> I shall add that I think the fact that the registers that are *not* fields still
> gain their dedicated type in Nova driver is due to the limitation of the initial
> `register!` API design that *requires* unique types due to the `value.op(io)`
> design as opposed to `io.op(value)`.
> 
> I think even these ones should eventually be replaced by just primitives
> eventually. I see no benefit of
> 
>     bar.write(REG.init(|x| x.with_value(value)))
> 
> as opposed to just
> 
>     bar.write(REG, value)

All other things being equal, the second form is clearly preferable, yes.

> 
> Best,
> Gary
> 
>>
>> Another example is that if there're multiple registers where fields have the
>> same meaning (e.g. a device address), then a user might want to just have the
>> same type for all these values. We've already have an example of register arrays
>> that share types, and I see no reason to forbid non-array registers from also
>> sharing types.
>>
>> Forcing all registers to have different types is a design direction that I don't
>> want to take.

I also want to register (haha) a strong yet unexplainable concern about
this. Registers as types is something I've never seen attempted, it feels
strange and unnecessary, and just worries me.

thanks,
-- 
John Hubbard

