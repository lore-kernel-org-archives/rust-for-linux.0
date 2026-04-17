Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010043.outbound.protection.outlook.com [40.93.198.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D87537E30A;
	Fri, 17 Apr 2026 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412187; cv=fail; b=YV8HecrTaSqpC8FsiDqlob1k3HXULuANWfGJW5q9UYRmxW9CBqfkjhgg8nb91tcIyg6ynwS1LTdEaG3DOeNAk3bWNEAi/oYcgCWOw34PoQih0IGx2RJxbl7FkrIBz2znMpINLWROpDmqJG2uZG+gle04OLl0ZDHqWqbKMD+ZZjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412187; c=relaxed/simple;
	bh=m7pmgTbePmCYlldM1RGAw5hL8Zahk4Gwk4Ez/hDG9TE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=CIMOqo8zkQZzIdMfcei7CwAhCXori5nMX0qUSwS6y6sU6QPr0e4rpNfDxNS5akvFDebMyuuNKqFXgQXTYgR6SGUlX79/ULYdglOzZ0oE8GnvHHC5UzmTDaqujJ5SVOwrbrcV2J40gF4A1L056BxhV/kNzLfE8KTJw1KmGfMBI0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sKiSQA2g; arc=fail smtp.client-ip=40.93.198.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sKiSQA2g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9s2Y8rlKKNRh+Z/f+ftP/XKONI93Nn7xvpWBU/pRA5cDxL3iOSaEAQCLXXBepmSZviw7wpAGI9YkolOCAmVzZ/fK6J8ArAhE7LqGkLJUwVThyuwX5SmQAjU4TKB+dbJpHUKZa4Yih2EvwRxlckOX0lnSWnL75BiayzbsRxmFq54eD0ttiuSUvknLsfC0sJI/xx2ax0VWIDj67pCG7DVMIzfeelOkiDLYmy9pMf4TPu/Dr/7IiUqXkaMr84+J2TRb6T3XqMvyqyEknyKX8UmaKeYEzp1u6vZMsun+CSXFkecbA7Mru4cVTEgPq4JV1cpV+rdXHjOSgBnPQ7ZgD2spw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hy+jsg9cPegHY8hMYt14mjOZNZf7X+yCdmHPjC2tuwA=;
 b=zRpAHlK2qe1gHYt4YhcEiAWfZNKG3D2df7NFI6J0urtkrW6tg2mohTuO5yNAt+FZXfHQemuMbR8bPvAtSw9jhdqTFuVIjXIRVdo/GoefTVeBk50R0qqmgGjxNWxE2sgVt/IcN52vlgcDdZSRA9gP3WS+zlTqRGjFFxWxfa9zuDZcqq7FS+vJhjoqmYQe+NGUmyB9FC0e9nXkpprmAh5hfH2Q2SZKpQjsjFic5yT5l0a4sGftPCzfDNGcxOAua81sWHEwAd38QRA36LXEjheFE/qPimBIMHbsuRb3JPH6+8ysU99zt/8dRPn/sMEAaf58t1hNe7Z9NuuFYOLk4PWwng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hy+jsg9cPegHY8hMYt14mjOZNZf7X+yCdmHPjC2tuwA=;
 b=sKiSQA2gcpJYreI9+bsoeWoc+dM1xOV6VEFSDmz5K1X/fD7dVny1NA3Ah0bfErfFH7H3bmKWTudPaIhYsLnC4YfqbqIKLnw1bdnoutzLBxYL8dtQzK83IpRI1/cGlXs7B6l7rTM7MPu/sMCLcdhy6MtkTIHGcvagUsmsmk3/CRBoaNmhP9bVPUxKVlZTe4g38UKtfkzagH24crYf4pZEJ7sn5yusfcYdUxk2T6w6aHV/1TVgZ1k4W488SkavdkwRFCL+mVAimxAG8p+5oHNc7bYJhmKKE4C4Ub+VpsFq1vb/Bk4dP8KbMRI/nzGje1E9aHaygLtvjKv1czc7A9Kw6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.25; Fri, 17 Apr 2026 07:49:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 07:49:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 16:49:24 +0900
Message-Id: <DHV9K2GL5N6J.28JUSSFJAYEVI@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "Shashank Sharma"
 <shashanks@nvidia.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>, "Zhi Wang" <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "gary@garyguo.net"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>
Subject: Re: [PATCH v10 03/28] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-4-jhubbard@nvidia.com>
 <2a4c06e1616ec84e29166d881ec3240a1fd441d6.camel@nvidia.com>
 <cb2bf998-55cf-466b-a6ba-1851278bbf43@nvidia.com>
 <8e47b4697c213ce11dbdae8a1a3fcb591c69b34b.camel@nvidia.com>
 <8fb6c933-0cad-40b7-be0f-5aea648f56f7@nvidia.com>
 <DHV935P8FJU1.XZRWWSGFFE8U@nvidia.com>
In-Reply-To: <DHV935P8FJU1.XZRWWSGFFE8U@nvidia.com>
X-ClientProxiedBy: TY4P301CA0038.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee67db0-d8b9-42a4-92d0-08de9c55da4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ly7MVJIyIfdWLRccuQeeA9flt9loLBIeBKV9FaUK6H2h3wMRGVBz4E9PzCSQeQM7fEm24i6hyO5i6djckZ6Jzy1DKFNuk2O4i+h9Lv6uEBkNhXIdAM8wAJi3DB2BFld0jQ6yibxTFXiylIMVEcbwkSK0DJEHedC4EdF74v7QXnoBZp3GiG6HnXuhwlHss2RyQnkXF7bsNmcf40tAEqeCExepgV1vE4f2q86/D+iXXoVvxbjx7eRd95kWS5qY8TLaY/jvrAPxrc2FX/mzXA5XjTiSXUVCqZtBuzplmGnZWae3xJnSbVt19WctqH1imhU9xapwXZMYQ169CVD0pc9HBIKyil6IZox+24n0KtAsq5I6N8Ng3vYoZsX4zdHntP+LZ3i4ETfvdK9p842brbnKUW/OVm9ou5O2B5vRzD+vsH8wuyzAmqSMYgqrib9fz6tmIIXWQo2qKzMi7418nI2MdiCJ426SdLWLsMB3A0Y52F3l8rBJGxgrW4HqaMIW0AhBtrI7EXGQ9vhapBh+hJKg2O0TDBXqhnsDz8DoWpcvpcmtS//v1PNoa8M86/aTHTR5ghRlJW+g8rVvLA5BkrxVMb1DV+FL/8GfVTz+89zTra4DMnQLOihzo+kjlPohLqs1IkdTnFZudUPZe7UVwIkrd3jZYE0CpJ+j8KK4x39RSbYBXGyjPPtxRszJvFXlwPUkLwragy/jFyr1RyZHKrNDMWKA6RzGhfmYwxJvlvuZ/Wg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVVJMzB6NEMxS3crQWVsTHpYOVdXeDBKWjNudGJma0R2NkFJQXpJNjNtUU9p?=
 =?utf-8?B?QWdMVFlaNC9CeFlyZHpyMEZPZzdPRUZKSFBwa2s5YjQ1REtNZ2lwMm4wYU9V?=
 =?utf-8?B?cHk2emVkVHhvZmVGUTUrdmcvN1BzandHVG1mVm9YdU1Nb0V2K2lqWXJVdlNt?=
 =?utf-8?B?Wm4vWm9aa0pSaW52TW8rMk1KZG0rTnVOc0tSOTV0SDNpZS84N1QzeXJkRG1s?=
 =?utf-8?B?VEtpYW1kN0twTElMQWtsY3JHRW1jT3BaeEZQMll4Uy9NM3F0SEwrSm5sMlZy?=
 =?utf-8?B?T1BaZ1Q4V1NDRDN0aWVON3kxN1JLenZGWmxOWmV2eVRkamp0cjlGYVpCa1dM?=
 =?utf-8?B?MFlhRExtTHZXcWlhTENwYjFibVlaaFF6bEhibC9McU5yWFQvK0NERUY0Skxj?=
 =?utf-8?B?Uzh2YVZrSzh1bm4zZkpTYi9nQ2U4V0hMZzRWdUpUd0hqWWsxczdZUmVOTEJw?=
 =?utf-8?B?MTI0REhGZkhyUmdoU01reldBVGljbS9yVnBJSm1ZeHEyWnZqM3JXTlhxTDlU?=
 =?utf-8?B?YTdObjkweEYyaHIvb01SanY2RmhVL3RNVkxRQWpCWm13RlVrSytGMmF5cDBp?=
 =?utf-8?B?dHM5S29HVTVCQ1o3bC9ZclMwMVRyVmN4Yzl4ZVBjVzF0aWQ0bHpycGI3R1E2?=
 =?utf-8?B?dmpDb2F6TjRKOFdsZkVnc1RqK1hvclFuWTB5a3VIbFJ4dEVxektIbWNxajl4?=
 =?utf-8?B?RUQrL3RYeGllOWZmMHdWUW9hR3hjaUVkU3ByUFJwS0ZwOU1wN1kvRGUvTUs5?=
 =?utf-8?B?OVAvcFptVmYrdW5URG5vK0JPbG56Wm9vbzNNV3RJVVZXZEQvWTZaaE8ydHVB?=
 =?utf-8?B?citUQlRIbkp5d2tiKzIwVnl3UU1rOUtmeEtRVmRHeWlwZCtjV0pxN3F5L2hp?=
 =?utf-8?B?SlRiLzJ5SVQ5RGRXcDVWaGxnRVFYOEQ2dityTEdXZHJQR1ltZjJ2NHQxVXQv?=
 =?utf-8?B?MTlILzFUMzZVS2J3cWNmQ1lsSGxuRGFMdzVZSmhKNTQ3Z2FvSzl6cW4ybXJH?=
 =?utf-8?B?YXZWUDVKQm5RaWNBR3VObFpseC9ZTHc2WXViSkZ1bkk3TWRtTjh6NmVBNEIy?=
 =?utf-8?B?alZsSlZjcmV6b0wrTEV2TFQ0OUxMRnAwZzU5U3pmK0hFclJSRVVSY0dUcVdv?=
 =?utf-8?B?TWI0dExYNlBDUWMzQVVFVlphK3gwbnU1QlB1SEhtSk1Fd0tENFlRNlhZRjdT?=
 =?utf-8?B?QkFuTXFxeWtzcmlkZENaQ1BIN3k2VEkvZjR0d21qTFdVUHRnSnBOZkNGTFIy?=
 =?utf-8?B?Q3hOaE00Qi85a2hZeFFXTzE1RklQS0swNmljd3JoT28wOXYvcG92N05YYkd6?=
 =?utf-8?B?ellHV05PT000SWp2V3B3elRtQTZuZmVKNjJLakM2Sis4Q2lGT09sV2k2SFd3?=
 =?utf-8?B?aVFHR0Y4WEI2cnFnajhMSitlWDBFOEtCRXhXWjVwbkozcGJ4b01MN2pSWFdS?=
 =?utf-8?B?aFJIWFVYaTNBMmhZaGZIUDJXZi9VOHBPZ1lhbjVPU2xSWWpYM3lxbFNCODdH?=
 =?utf-8?B?b1hxSHpxa0p6eWhmaDlLK0hnT3FrKzVMSVZXeGcyTlVGQlhZZWNQU2VuRFNr?=
 =?utf-8?B?cGYzSXgyanA1Qk9HYXdGUEJoNVp6NEtubCtnK0UzTFRNS0lDNDFtYWJ0VmZN?=
 =?utf-8?B?UGlQamtrSWVzVFVZQ2NsTnF5Qkp2ZHJlY0NRaDVGWGMrakRHUHJZQm5kYTJh?=
 =?utf-8?B?S1pucjU3ZWlnMFZkS2IwQjhlL2VxM2dRajE2RUpGRDZBc3JOeHhEVDdLZjU5?=
 =?utf-8?B?RWlNV0tieUpKVGR2VmlmdGNOaEZMaHpHZU9FVVpZcVcvend0dnpOVC96OHRv?=
 =?utf-8?B?ZWZzVWpUNm9vZkRsWWFjS2JvNlIyeG5BYXBCK3h6a1pEdXV3Z3pBTmY5K28w?=
 =?utf-8?B?TWhuT0ptTWd1QVYwU2hGbGFYS2dGMkdDTDljUytzU05JcVE5OURPNjUyTDls?=
 =?utf-8?B?bmVuUVFoYURUNWkvZTNVKzBVVE5DUWhZQkN0TDAwWG1vVmo0SDVFN1J1NFM1?=
 =?utf-8?B?Kzg1cEJMSmZuR251Kzc2M3NJWjJTdTFGcWNmSFoyOUV6aFRONDFDTlhzY09I?=
 =?utf-8?B?YUlCdEwzSTlMcTI3QXlZNjh4TW1XYlNHU1VEUTcyY1A2ckRzL2EyTGFpT1J4?=
 =?utf-8?B?ZzVxWEwzOStEcXhBa1BSNmpSMWxtbFVpSkU1dGtFNFJvMmNtbktXQ09HQUVi?=
 =?utf-8?B?T3ExRDJZTkh4VUtOTmFzcFE0SmZ5amRKZytyQ0hWd3BpZTFKVkpidWZuWkMr?=
 =?utf-8?B?OW5LRm5QVFpqSC9ZUVhlRUFqK3dmVVJZUXowTElQZkVtWlZLWFNHOWhCdGYz?=
 =?utf-8?B?S1o5TzdWUC8vbXAyaitlNzI2SzlQWlJzcFJBSUhrK1U3Z3c0NUJYeWc3SE9Q?=
 =?utf-8?Q?PnSojzmxDhoyI6W+Ywz5lb5a95pAM89pYjwVPARuzHNUI?=
X-MS-Exchange-AntiSpam-MessageData-1: nFAJp2pY52buYA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee67db0-d8b9-42a4-92d0-08de9c55da4a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 07:49:28.3083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mb3eblGIB+Wbrm8LTUoYblYw1z4xi3J3QQho7E+oZtEv8F7DR2l6Id43MIrwzEakgtmTw2HtmLLsi85Yjkjgog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6416

On Fri Apr 17, 2026 at 4:27 PM JST, Alexandre Courbot wrote:
> On Tue Apr 14, 2026 at 6:29 AM JST, John Hubbard wrote:
>> On 4/13/26 2:21 PM, Timur Tabi wrote:
>>> On Mon, 2026-04-13 at 14:08 -0700, John Hubbard wrote:
>>>>> Can you add something to the patch description that explains why Blac=
kwell, unlike all of the
>>>>> olther architectures, is represented by two Architecture enums?
>>>>
>>>> How's this:
>>>>
>>>> Blackwell uses two Architecture variants because the hardware itself
>>>> exposes two distinct architecture IDs in NV_PMC_BOOT_0: 0x1A for
>>
>> This is really what drove it, for me, though: the hardware itself
>> saw fit to identify these two variants as architectures. It's
>> encoded into the very fabric of space-time itself! haha :)
>>
>>>> GB10x (GB100, GB102) and 0x1B for GB20x (GB202, GB203, GB205, GB206,
>>>> GB207). Open RM maps these into separate chip families with distinct
>>>> HAL routing and different firmware signature sections.
>>>=20
>>> We don't need two arch's for Ampere to handle different firmware signat=
ure sections.  Looking
>>> through your patches, the vast majority do this:
>>>=20
>>> 	Architecture::BlackwellGB10x | Architecture::BlackwellGB20x
>>>=20
>>> Looking through your patches, it seems overkill to separate these two. =
 The one or two instances
>>> where it makes a difference, an if-statement will suffice.
>
> I have to agree here, if we didn't split then the architecture IDs
> `0x1a` and `0x1b` would need to both map to Blackwell, which makes them
> impossible to represent correctly using an enum.

Sorry, I misquoted the email in my reply - to clarify, I agree with
John's point that GB10x and GB20x need to be represented using two
different architectures. :)
