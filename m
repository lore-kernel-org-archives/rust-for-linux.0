Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013006.outbound.protection.outlook.com [40.107.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D13F28314E;
	Mon,  2 Mar 2026 01:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772415906; cv=fail; b=J9gX3/VIvzWK8OoiEV5j9vhXzMjotxpu817+mBxhOvvVZ7z8FXgMChSqcnx/Tfe56+75yYZDuah/fD5lo/mRty/o4hnGEUQ4idtO6i4VeNOYYcV1JbeuchnnnxlPL35GmNzL56xE+eNR1xRREBrbuGBazcXtTuDHAbZ2cTKqpdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772415906; c=relaxed/simple;
	bh=sz/BDJYOrAODFqkBgFq9M5FEHnDpYhUNgh9iGxfrB9c=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=WPP1S+z7DHsKOhB3wgym7X/MsuVW3MAB94vU+/GUTntkPC2LdHHVc+fDgFanGYyypSx12CpRuPaKQ3fnNd7+rh/nkP6VrNqY5A2Hd6/5+guli0NX2CmJSNV3HTUcZTy+epBYdITaOlfWExv4OapOCZK8i1s6b304MlpimMmo7zI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PdpyTRxC; arc=fail smtp.client-ip=40.107.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PdpyTRxC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHlzZxk9FWwhsPBEhky1ZwK7FiPqaM8y2zvKViG7LEfPvcUtTp2IDCNu14t7jYTP24YIQX7C3Dp8CcVh1Ldc69tvmm7y7lmBg/TkNcA22ccXm0W/56OFxC+BkTwJ3eeX2LU2dv3sM5ulvKCjEEVtaB0LC6Tv6b0kvGm8zzwKWeNNAFEfrVqsMLipOK6XM/3B3xkMG83JN5ChJoBN6MDJ0W1bjsVDJSF0JpenbFs2y64pISDi92jobc8Z+a2dmlYdITteTesA64jr8LOxtn7eZUhzI7v+mXZMYS1slD4gp/J+L1f55CxBCjwEbVFA14lcPoUirL23YIvgUOikUaqBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8Pd9PYWzJ0uR9ixYZdVbnxq4/1rAyHCfqH1s65iiTY=;
 b=NBzp6bH652wpmhxdFgQklZk8M9cqq7NrRyFfYTF4CI3MK0xXF6XMBxsoroHl9l+9YSZHeCpdeHbD/41KgG5VCYNjtAGvIbHGT/0JoOjXz0UZHfMGFiVpo4LhzaOGXHYRroog37MAIvmOhlH5akRZ6P4nbWZ5HC2Hj4guLa4bY1536tuorwd5x+NcSdd02LREPlEIALZpl0/RE1WBBmGWWu2LufcKV0LcRZoYiNzuoLY5466mr+qS1jAC5dckxWUm04hi+qiJy6Ao/KOzwxcRK9Mr25Lx/pzmAJ5kGizJuiAg0g9PJ7HAV6Kx3JWo2YryUXZvqxiK26tQtY+hoiZQRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8Pd9PYWzJ0uR9ixYZdVbnxq4/1rAyHCfqH1s65iiTY=;
 b=PdpyTRxCs6qUZ8mNISDdupy3BDIqqY6ep2vKu319G9nfeNK2jlzVt/fbmSZdGVFexX6Xpv+CU/96P71/mLm5FxWDYp5zxyc4x+vXD1VLCYDgGBQgOuI4/mTPUQGRausecqWoDF0XdrMnuRnfZy2xHoj/NH07jez79/V1jvl2cPHl33Z1ZtJxRs7fGzqo71vhHhh/53nwRaPFBA9gpmiJ8OIAo7rKtUXjjcX7OkGPnCdF45kEiO1DUQyoV/W29DWxu/S3XMU/c7zZYKiAZKhMK6srfMtnU+fQDmugfLuUUsvKu0vboTKYUMVvu5ak1K6BrYKkqWiV0P/M8whwLkHcRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6977.namprd12.prod.outlook.com (2603:10b6:510:1b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 01:45:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 01:44:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 10:44:50 +0900
Message-Id: <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Alexandre Courbot" <acourbot@nvidia.com>
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
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
In-Reply-To: <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
X-ClientProxiedBy: TY4PR01CA0010.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: c899e5b7-d743-4144-3443-08de77fd4d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	UdBfqm9yuWyU5mlPPnj7chaPp1lzhGheBiu21WUjqf/07efgzkveNz6YMzzTCnta/tk4uVp4YVQtYUMjx5jLLVGxIencWfgW4MywydWHTvxG28N4t8mILywRUHAu6CuoYc4n3Jz3Nd7NkCdgO9RMbxXybuaquhXvfWZkJaiJCz8M03N0jj7jJR91qbTbFL99F4jpQ0WtnK743GjHgNGbYa6PRddT8v8YdyXuDs1qL9IC2SqE2AJZoxxpPtNrghLtX4672m7VPEXG79/nC14DZsgeCwOiYOw70rlY2LyGtYKienXtXt5bVUbfZRov45yLzq9jKqbhq2cRVpUIPCRJNLu6WwJSaon4h/7JeE3s1Co1OycQPfVl0UReGI432TaFyxF9hI8E/AvATZ7v/kBsBJkKrvfMH3rtQaQ/P3JMyTwSyW9X0LjCzavr/bFe6DaZkFvdI5XCJMJ58EW2myiLrvI+qEGCbKBb3hYvORAfj3UUW1MP6asJjFwGSU8QCKr4Nmi0/EzHmJoYEeLn55GLLWqPGOypod6tpkzYQW/XZXBON3gK+vnHmf2jgQD6unhMUS2kQTn6Ccp9Nlkmmk59WuXSyNNoJgHxpw9vt34V2dMj4JYOnf/sOD8DVSBTQ/7x9SRG16CIrzt3q7V7Ynt6Jm87fmyR3QIr/ORGx80Zzp9IDPdjhfTFBrpEO/BXlLnKx6bJ5ckPhMuL5KLqJ4ODLy+MNj+BzDNqVHCwveW1jGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXhseXU5bzFJRlBvQXluSEozcnZqaUJvS1RnNWpzZjI4dTNuSERTOGFhUlN4?=
 =?utf-8?B?bXdpaXFRci8rRVQ0KzFvYVVsbFVPUzBTVVRPN1N6MkpuNS8yQzFTNUZSaFdE?=
 =?utf-8?B?MHk4YzhJYkp1cy9vR0hOTG04QWtPMUlQTVJBVWJrQVhydWpFY21YQ2hWblV5?=
 =?utf-8?B?cnJXdmwrOVY1K3VkMDl1ZDRGVGQ4ZFBhYUxZbERqNk5qUVBXTTZ4TS9sSGdp?=
 =?utf-8?B?a0hOZXpDbGNDcTBBTTh2RE5BNHNMWTRIS1NGdy9zd2tidk5lbldWNFVXYXN1?=
 =?utf-8?B?bHRhK1ZIS3FSUzg0SWhqSkZLRE80UUUveVlsTkxWQVhlMGVBOHRma0dLZVh2?=
 =?utf-8?B?ZFh6dm1UWDFIOE16ZEFrTjB5OUFwbytXMkgveXN2YVRLR3RacWRKWkpwMG1K?=
 =?utf-8?B?SDE3d2pHZnE5Y2VhTTJRMXl5SW1xK1BwaHdBVFl3T2Q5eTJUb2h4S0Y1VUpi?=
 =?utf-8?B?emU1ZXlFazAzUk14SlA5WUpMZndBcUVzblh2S0cvSEkyWko2aEs0M3dkTi96?=
 =?utf-8?B?L3pRMU80bTc4djRwY2lzSUtDcnJ0TjRJMXdvR05xa1ZJb2FDTzRMdUlXK0Q3?=
 =?utf-8?B?N25qNGZOZ3hQZWwwaW01TVlLbkhmOEVqa1U5WERyL3lwY1F1WGtDSlA0V0c4?=
 =?utf-8?B?RFcvRWJtVVhuRFYzaEM3STAwc1NiV2crMXFna3p0QlR6dnYzWDF0TCtraDlT?=
 =?utf-8?B?MXNRUVZqMXFSVEZpdW5ZS3dldXlpbFFROUtFdW1kZVdnUVlBQ2xaQVUyNWNs?=
 =?utf-8?B?VVV3d2kzcUFHckNyZ21zVERQeXkyelAydEhOeEllNmY1d3dNOFh4a01SOFBs?=
 =?utf-8?B?NmpJVWVmd0E1ZUk0TEt4czl3ZUxGVUYzSzVEQVQ5SlJNTi94NWJ5akRYMmZw?=
 =?utf-8?B?eEZLb05LZ1Vya0ZRQ3NaU0d5STBrWGRpK1RtUG9meExFVUNjcVJpNEpTN3ZD?=
 =?utf-8?B?dm5acC9VLytTT1Y4S290MUpvS01keUJ3cU5SMHY0YTdWa0hLWlNBUUoxM3g3?=
 =?utf-8?B?eDQwOVQ0b253QW5FcE4zaEtLS21PUTJFeGFLZEhneW1qbllLeVRpZGhQOWFh?=
 =?utf-8?B?MzZ5WGJvd0k1bjR1Q2pRamFtdGZCT2pSaFlLeVp4a3Q2R3VoRGNLc21Bb0p3?=
 =?utf-8?B?TXNTcFk1UFpoYTZ0WUVBWkxKVFFLYk9YaGkvdXcwM2llSCtrbjlCR1Z2eStS?=
 =?utf-8?B?eEx0NzdWZ1dyRGJ0NTFBTEJsWDdaSXZPSkNPM1kxcTJRbWR2Ri9mTlZ1dzZj?=
 =?utf-8?B?YXVva2F6Vmt0YkQ3bDVvUGtNU0hOa0V6c2Z3c1JhUUhYOXRwTnMyNDcrZUFv?=
 =?utf-8?B?YjdkUyt5dS90dEIvbTJzLzROYVpVWlFlcEJVekFHVjhSanhJK0xOenJuMXE3?=
 =?utf-8?B?c1dBZGk4QllyQkFCdEV2UEJ0aFFLTFJWNWlOalQ4cmxWS3E4cENWRVFmQmpl?=
 =?utf-8?B?Ykh6SThiUjJQNW90QVBHaDJ1VVU2TlhiTXorVUcya096VlBSK2lqZTVlbXhW?=
 =?utf-8?B?VVY4S3dJSXQzUURLS1ZUbXhOeXp3b1ZEOTVMTFhUZDQrUWxjVnFFNVE3WW9D?=
 =?utf-8?B?SFhLMUlNbG1WUVJFLzJhREIrQ1IrRWhoTVpZZ05jWmx4MHJGRlRuQ2lhOVZQ?=
 =?utf-8?B?NzR3NlVIOVZ2K001NDltWmVnSURLK2tTVEVxOG03QVEwcXdlTUZ2R00rZDhU?=
 =?utf-8?B?SVdIZ05rSGhOVXNhNXBlNGZIVVVjdGhSSDB5Z2JQMVFuYXpqNWgwSlN1NWlG?=
 =?utf-8?B?TTdzVFNCVDlkRWRyNktmRlgweFZudm1UdGVmWXFZVFJ3QWt6NlJHMWNkQTdm?=
 =?utf-8?B?MXlSRExMaldnakMxUW9uaWF5VzQ4RGNRaXM5TUk4UlFMM2RLQ25WaFhDNllL?=
 =?utf-8?B?eWlHVnQxY2JYTmZkR2hMUlRvUkVSSGtNYlQzK3lONGs5QWJaK2txNWZGQk1Q?=
 =?utf-8?B?T3VLOFFmMzRtaHBEWWFHWXZSYXo3WDlSdDJCSC9rbkxWV2dWTXI2azFyMzVK?=
 =?utf-8?B?TU8zYnJ3d0Y2NFBhZDNMZTlGLzBuY01IbWFBNlpCUGpRV1hFNXNraEZtTlM3?=
 =?utf-8?B?eDdUTzFldmxUMXpoSnM5aEdmRlJ2VFYrWFNMcm03WWs2TmV3NVR1OG11MkZC?=
 =?utf-8?B?MlpDSGxWWXlqZTJiSURRRjlFZ0Z2Nzl6UTNBQlJCdWkySmJYcUQ5S0I4L3A1?=
 =?utf-8?B?WVExRmtkQ3BlamRZS2xpc1FLTWNhcVMySjM1S2pnNzBJbTRwNlZseXVUSFph?=
 =?utf-8?B?UWUvckdQZlFsQVZRdExZQUpGWEVtczRkM0xIWGFHQ3BxNlFGTXBReW9YbFFp?=
 =?utf-8?B?WkxwbjZ3YU14VmtGQ1UxeVJINEdlemlGMUJCS0Q2Z0ZCZmc5NWJYWkZ5NWhQ?=
 =?utf-8?Q?Nwc+FunT2XGnJTDfCmXbYFutYSJSE2GYw6kKdqQQ8UvmZ?=
X-MS-Exchange-AntiSpam-MessageData-1: sOpoZSh0D8gD6g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c899e5b7-d743-4144-3443-08de77fd4d40
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 01:44:54.2492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1fVbf1NDHnjsVwVnfV9o4hV1xJBebRYFug10vWIiPhVRR6xbxLx9CKTS9zXUpF9dc6GdTI9+jz3FlRA+uqwIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6977

On Mon Mar 2, 2026 at 12:11 AM JST, Gary Guo wrote:
> On Sat Feb 28, 2026 at 12:33 AM GMT, Alexandre Courbot wrote:
>> On Sat Feb 28, 2026 at 3:02 AM JST, Gary Guo wrote:
>> <snip>
>>>> +/// A pending I/O write operation, bundling a value with the [`IoLoc`=
] it should be written to.
>>>> +///
>>>> +/// Created by [`IoLoc::set`], [`IoLoc::zeroed`], [`IoLoc::default`],=
 [`IoLoc::init`], or
>>>> +/// [`IoLoc::init_default`], and consumed by [`Io::write`] or [`Io::t=
ry_write`] to perform the
>>>> +/// actual write.
>>>> +///
>>>> +/// The value can be modified before writing using [`IoWrite::update`=
] or [`IoWrite::try_update`],
>>>> +/// enabling a builder pattern:
>>>> +///
>>>> +/// ```ignore
>>>> +/// io.write(REGISTER.init(|v| v.with_field(x)));
>>>> +/// ```
>>>
>>> Thinking about this again, I think we might still want to write
>>>
>>>     io.write(REGISTER, value)
>>
>> This was the original design, but as you point out below this makes the
>> very common case of writing a register value built from scratch more
>> verbose than it needs. Real-world examples are significantly worse, e.g:
>>
>>     bar.write(
>>     regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>()
>>         .try_init(|r| r.try_with_offs(load_offsets.dst_start + pos))?,
>>     );
>
> My main dissatisfaction with this is with the function call
>
> I wonder if we can just have
>
>     io.write(loc, value)
>     io.write_with(loc, updater)
>
> where the latter simply is a function that does
>
>     io.write(loc, updater(T::zeroed()))
>
> then the example would be
>
>     bar.write_with(
>         regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(),
>         |r| r.try_with_offs(load_offsets.dst_start + pos)
>     )

That should be doable. Note that we currently support `zeroed` and
`default` as initializers, so having the same level of coverage would
require two `write` variants. I'd like to hear what Danilo thinks.

>
> [ Note: it's possible to have write_with that works with both fallible an=
d
> non-fallible callbacks. You can define a trait like a monad (well, not fu=
lly
> a monad, because this just has a map, not a return and a bind):
>
> trait Map<T> {
>     type Mapped<U>;
>    =20
>     fn map<U>(self, f: impl FnOnce(T) -> U) -> Self::Mapped<U>;
> }
>
> impl<T> Map<T> for T {
>     type Mapped<U> =3D U;
>    =20
>     fn map<U>(self, f: impl FnOnce(T) -> U) -> Self::Mapped<U> {
>         f(self)
>     }
> }
>
> impl<T, E> Map<T> for Result<T, E> {
>     type Mapped<U> =3D Result<U, E>;
>    =20
>     fn map<U>(self, f: impl FnOnce(T) -> U) -> Self::Mapped<U> {
>         Ok(f(self?))
>     }
> }
>
> impl Io {   =20
>     fn write_with<R: IoLoc<T>, U: Map<T>, T: Zeroable, F: FnOnce(T) -> U>=
(&self, loc: R, f: F) -> U::Mapped<()> {
>         f(T::zeroed).map(|x| self.write(loc, x))
>     }
> }
>
> then this returns `()` if closure cannot fail, and returns `Result<()>` i=
f it
> fails).

This approach look like it could also be used for I/O in general - right
now we do not handle bus errors, but we definitely should.

>
> end of note ]
>
> BTW, I am also not very happy with the `::<E>()` syntax. I think with the=
 I/O
> projection upcoming, we might be able to get rid of relative offseting
> completely by requiring user to first project into `View<'_, .., FalconBa=
se>` and then have
> some registers that can only be used on `Io<Type =3D FalconBase>` but not=
hing else.

That's something we can always update once I/O projection is available
if it can indeed be applied (using a two-steps approach if necessary). I
can already hear the pitchforks if we don't deliver some basic register
support for 7.1. :)
