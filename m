Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011068.outbound.protection.outlook.com [40.93.194.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2919531E859;
	Wed, 11 Mar 2026 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236124; cv=fail; b=gqxaIWN+e8Qu6KIBO8FWSiAlRXp0uVQf6IV282yXWmFoYk87H0aUb33qG/l40rmCv7/4JyFKqA2GOP+bta97XMGq2rBCGV7vCdvTbYqL1CzUrjsFkz2ntvIHpRjs4GL6HCFCyxcKGijdIRHwFcp2ejVdLsmjgH/21zQk4PUp9hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236124; c=relaxed/simple;
	bh=qeHKDzVC4h71NWz1XhA9EzW5k7u+HtHEW+jTeKwg3CI=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=G1JLiZM5u6MnB6Uqie/S/Vd+9x6IRETasPbzDTz9HJ7rF7iMKn/T4EXQRb0YVyP1LrYQDKjchwJ/4WxWRROkiTTMpjWotpV36XCwnfiTmp3ufhDEHA/ZINFjyAeI8Mh4SRdpXcZyqMTJQd6J/MSUqzCPOScmZnoilh+3g++4+dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aATdoAwA; arc=fail smtp.client-ip=40.93.194.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aATdoAwA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyruostYLLqWIWw0Yf0vUvNBjMX1YN6pbIgRLvbTjnOXxADPm+Pnz1zDWowBYTEJELCROkE6SQFXIipeUUuRjwHdG9lUONevdBHiS1bj0PDjGGAsLqPlSp6lzC0wTgclGea1EzXcq8rzDdfuYfuKvZ2DXVFtM+MoayjCIR637is7C4Y8fJglocb89zX9pakOhdFPDw5/I2B5wgxYrQkGbYwVeEuEmrI0Qwa0tlcs4Oau9iVhFMfnIWLSYplzjMT2sw2CgDQZWm4juTQjCu7w/BqCWtGeiTOpFF89rPcpWwJMCYMQhQk3Q09fewV1oFKF0nQQN1Ami5rbiQkFSARMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjYJOhRNGcOHVeViI8cntQHl2bMK+93iC5Zult33uBQ=;
 b=vYj7v1l7acR6h5R9mD3l14juG9+SKdEu84fN2Ao7GhTg4o0S/tBZ5mfnAmGM0NyIrdkG7Z2ZGpkq2QZA7yNksi/hinFAYivrMJTcnwWOkCNqGwkbILgXuxlMOqFl/cv9Lk+5uDDkTfJrszmdrrkVDvf53gCg1KWaRuA6Mzm9FL+rYXoitdMR6bEjFsJiUAczcBIFDDF+GGoeeCdMqNHLeltA57cSUKfhIBMtw01LniTfqcQu0AsAZjclodTlMRqkQLb79pmhbqrCxIPSK8u3VGgp5WbXPi/xPGMvfGEZlneEX/9jHsm+MxkPqeQTVMSrZ4fGqNCiIExSpRmb/pT81A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjYJOhRNGcOHVeViI8cntQHl2bMK+93iC5Zult33uBQ=;
 b=aATdoAwAuJITTPjLFst1NHhX2EvOv/HptU1Aq1IdP290u3bYTJ4XuVeLm56K24+vb5RA6stD0wNH9RAjfTI4d2afaCam31Qp9DTtrzCwOp5MbNIr8zraap9tLbCIqIOYSpsSDzVKQl2zyJyQikVheAuQ3upieCiBI2zUZ7ID0JOCZ4df/YTYTa11ZT/WcS+CrzegrTsVDEY7vtDdl2GF2gF2SBVY+FN/rdQ0uTYCDmdbgaZn1ELVDGSoyOHvajwomM7bnSpDqxTvDFQT68+8Ks2CRWZmqTvJBSVnpToAscBujQiYklELk4oXtQHtUFnlhO2bPSWajBMG2jTcD5eg3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8792.namprd12.prod.outlook.com (2603:10b6:806:341::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 13:35:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 13:35:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 22:35:07 +0900
Message-Id: <DGZZQM4G6FRS.187T94FLRZAR0@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 00/10] rust: add `register!` macro
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <DGZ9WXGUA19W.RYEM63UQQ358@kernel.org>
 <DGZZ0W7ZQ6DO.3NBYFWFGPPUN8@nvidia.com>
 <DGZZ53BQ61AF.3HCJ598LHXAFG@kernel.org>
In-Reply-To: <DGZZ53BQ61AF.3HCJ598LHXAFG@kernel.org>
X-ClientProxiedBy: TYCP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::17) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8792:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a41112-230d-44f8-1b6e-08de7f7304b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3s2qRVB0xwMX0ZJBLzlE6X5uzuY/wMoblmKttajaXXedhkr25oQRf21dH2vyjX0usVPbf5sWTtZDCxf4lUrjvPn99smPt/wmNI7edtcZV8ORBK6OBeksF8MVMY+NccY9cp403VRo52sRFJJiNtbpLvuyuAfN67fuRU/cjj8CscjKV4uWlyG0rk77DojhDlJSNq0EsaLN3X9PxwaMvEwHPuZls9uqHhWkOgRma7RF4VXGl3WyVIYOW6p9N0u5V8Tz5YWwjKRIDGJIB+iVJrrikt8FQcrBvFtkofgj72KpQTl2Rb55Aafsnq8hPKkXTDE2v7/+WUZGLYjkVjE2RLyYqdBN6Phc8MIKlS3X/ha+w840jm17xYsC0GRfuaXaOka2fYNfQvPAYuGWbXbVRsB2hfa+PUE768qURBB8weg4lsBWeBfVvG+8fDBDGKVDGbyM0UpuG1Lr0/X5cbSv2fXX2Og0pO7kCAx4UruNXEQOuMftHAwrLwrTKsbo+8QQy1GRebbHn28Kxj+T5NnDluk+Lcc9n8lXD+kUOnDpdrh4csEQmwXfe8i3yu/XqLhdGlhdyQ0i6XXWSwXt4M8YGfyYgsA0w27gJU18/DXR9tZo2nK2ONviXzBXugfFpshxHW0FeiDzxSlurRcUfzhXBkFEfz3OsYP9t7A4TQYHg0cgOxAZnlhaEPBkix3iSXnk9wYJ6SxZ64EzOXT/h4U7RSrGe0wUjYJrQNmN9x/NNhj9kl9yuZUZxSsFhrqWxnWA3RZU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWxGYklaYmFVNmhIVDdxQWxVMDBaVUtRTzdlOFBPbjRHSjk3V2YrTDlvYjFT?=
 =?utf-8?B?VVpJSWRma1FVZEVCTU5FNnRzWWZMMWZmcTVIemxoS2ZieFBSTEdZaUxpVitC?=
 =?utf-8?B?S3M1MGhCdFBLM2NGcFF3UTNLRWNWWVpkbFAxbzB4OFl4TUdxS3BuSTc2ajdR?=
 =?utf-8?B?SWQvdmtWNmJoeXNXbUtzcHhwakhHSW5ITzZlVEhIbVZwaEtydCtIRkhvSUlr?=
 =?utf-8?B?NXg2VmtHK21VTVg0N2J4UEZQMWwyZTNma1RwL2wxU3NtOE8vZzMxUTlhRHkz?=
 =?utf-8?B?S1dGdTRpMlZlS1R6aG1JSzcrUE9OTmNDMWltU0tNcktpYTBQR2k1d0NFRkVi?=
 =?utf-8?B?TWZGS1cvNXM3endHbW5qSzRmbDZDMFhZVm9ZalVvT3dGa0EvR2VLdHVKc2xq?=
 =?utf-8?B?WDlKdXdQRjNKcElLZ1NaZUU5YzFiUGtISmk4cytnbmFUY2JraWdrYTl2bHgr?=
 =?utf-8?B?TEYzVVJ0MUprTGpqSGoreW1HRWlvVjQxZjVSVXdKM0NxbVJQQlF0cm9CQ0g0?=
 =?utf-8?B?M1dRWTNQK1YyNURXenMzWkh5dEptTUhFRHNJRndCdkhLNFUva3B4RGpKYVhq?=
 =?utf-8?B?eWtsU3hMTEh2cDZnYVhGdmllMklPZXI0K2dzZ2JpU3VGcEtWaFpybW1uSm1J?=
 =?utf-8?B?cm91L0ZXMU03M2hVcy9wUzdDaTI4L290ejI5cHNVRFZCQ1pmOHVDa1p5Tndk?=
 =?utf-8?B?TEJLb1RWeUFlSDBQa3cvbEFwWWlWRlVJdFR3YmsyRjRRekJ2YnQwdXBzdnZr?=
 =?utf-8?B?amM3RVpCeEpycHo1SnY4bEljemFodk52bnhKZ0wzd1RReUkxUWZ1cnp3NFRq?=
 =?utf-8?B?N1hPczdwcGFGRHdLVGNVQ2FJc2YrN200NkZSS1pHOHU1dnd1VHptaXNnVXVP?=
 =?utf-8?B?UVN4M3pIUi9FSDdLaU9oS2VUblZUbnVMVUN2OHVvNDdRdk9SRitFcEhYN3dk?=
 =?utf-8?B?UXZHdjlTWGM0UUdvcjUzTlFtcEtJRFVSUlB5VlBhNW91TTRsbzY4Wjhzd3JS?=
 =?utf-8?B?R3E1VzBZL0tyVm9FK2dIdGhsdXMzKzBSS3Fvc3JGbENHdWRGRjJVc1h1bm9R?=
 =?utf-8?B?VEtrdndoVzlWVU1jL29LVzZpKzUrOStMeXN3ZXA0M1FVUUc4L211eGgvSDNJ?=
 =?utf-8?B?YlpiRCtxVjNMSW96UjJ6ZVo2ZzVObnBaMkxjRk5nREYveDJiUml4QTZUMDkw?=
 =?utf-8?B?L3k4V0FydUYzcExXUDNUc29ZRUJXVGo4LzUyWnVRbktsTklTL2JMM28wSU1v?=
 =?utf-8?B?V0pFakdHMWhLc3p0TTJ0VzFpNmFMRmNXeTU5UThvRWhNOTdNWVVBKzZkZ2wy?=
 =?utf-8?B?cStoYlpORTRUelhhZVpyYWNJV2VURkdBdGJkbGdjTm43UGJ5aGIycGVOVmFo?=
 =?utf-8?B?TEdqYjl3dDF0cVU0U0pEK1ExalYyOWdza1NSWmhJWjgxeXlLVkljMG5HNHlN?=
 =?utf-8?B?Rnp5TUt5N2QyMmRVc0oxK1VIN2p5cjZaYWYvUjhpS1U2VHQ1dFJMZ0FFSzJu?=
 =?utf-8?B?MGQvUi9vM09GbkR4aDc5UEd2OVAxOXl5MTBxK1c3TkRLS1JWdWpORTV5RFpD?=
 =?utf-8?B?ZlUwb2NiM2NOcWYvOThwWXBmMHpQZEhNYVQ3Y2NaMllUbDJVWE5FbHJQTE4r?=
 =?utf-8?B?VHZISU1zZ3h3Y21DWmtTNjZHdlVpbUtFalBiNUhJSFNYeldIRkc1aHZXVE9W?=
 =?utf-8?B?YzlTQ2xoOGV1dEhSeTUvUUpaSW55OTN0amJZTnJuWDZEUENpL2FIRlpvZ1Fx?=
 =?utf-8?B?RDJIR2UzWW81empsZ2E1YnFWRk94QTNUTC8xZ3ZybGpEcVZaSGYwUnNIK2Z2?=
 =?utf-8?B?SUZhRDFJbkdDZ3pTeFBhdURnVERhbHU1TklXZmJwb2t5TXVEUDRpQzhmM0tv?=
 =?utf-8?B?S3V6M3R5ZVJZcUJCUzBGd3BwdnlaTllrL096emJxbXZYVko4RUxZNjBiMG5T?=
 =?utf-8?B?cDRNdmtWNzVuV0FlcFA3NzFxc3BTNjBodElsbnJwM2NOWFRrUlQwTVg4SWtD?=
 =?utf-8?B?ZnRKNDA0bEVGU0N0cDNST2tYeDV6d2c5eGkwT1ltVXFReDRzZzF1V0N6VWFE?=
 =?utf-8?B?VGlVWjBKZ0Z3TGpYUnRrVUhocnROMFNwaUVDNDN2TTVJUWdkTkhTTXF1aER0?=
 =?utf-8?B?MCs4d1VQRVFKaWtzRmEra25rRkhOa0tXcWhHWTBRbEJ1WTllTVJIcWVXMVZY?=
 =?utf-8?B?VkxMdC9Dd3JxbHdkTnppbGlxa09wUWR0T0tmN25pdElzSnNQOFZ4dC9zVm44?=
 =?utf-8?B?eXlkb0NUbnFQeGZ4R080TXlEd2t3eUE1VDFaTzRXb2JobUpsbzBsQ2xseTc5?=
 =?utf-8?B?blI0eU84OXZ1NkkzLzhnZmQxUENkTGI3STJsU3JqaTRCU3cwU2Vta2pUSnRp?=
 =?utf-8?Q?yxx/hHiUh8b0UYNg1lBBCOkXLjCJnUzIgvmytx2seNyb+?=
X-MS-Exchange-AntiSpam-MessageData-1: jvBCdfYnHY0HkA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a41112-230d-44f8-1b6e-08de7f7304b9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 13:35:11.7558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSo3skQaltmo7g7R+jxqcjV9c2GpXOtnsP5ssLZQp7JdYD9oapi+NdBQ/HxwWJn1xMFlne6Q8VzKLPODPLSf1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8792

On Wed Mar 11, 2026 at 10:07 PM JST, Danilo Krummrich wrote:
> On Wed Mar 11, 2026 at 2:01 PM CET, Alexandre Courbot wrote:
>> On Wed Mar 11, 2026 at 2:20 AM JST, Danilo Krummrich wrote:
>>> On Mon Mar 9, 2026 at 4:13 PM CET, Alexandre Courbot wrote:
>>>> Alexandre Courbot (10):
>>>>       rust: enable the `generic_arg_infer` feature
>>>>       rust: num: add `shr` and `shl` methods to `Bounded`
>>>>       rust: num: add `into_bool` method to `Bounded`
>>>>       rust: num: make Bounded::get const
>>>>       rust: io: add IoLoc type and generic I/O accessors
>>>>       rust: io: use generic read/write accessors for primitive accesse=
s
>>>>       rust: io: introduce `IntoIoVal` trait and single-argument `write=
_val`
>>>>       rust: io: add `register!` macro
>>>>       sample: rust: pci: use `register!` macro
>>>>       [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro
>>>
>>> I did not look into the root cause, but fetching this patch series my b=
uild
>>> fails due to a build_assert!(). Maybe you have CONFIG_RUST_BUILD_ASSERT=
_ALLOW
>>> enabled?
>>
>> Nope, it is disabled and I build with Clippy so I am surprised you are
>> getting this. Do you know which module is failing?
>
> ERROR: modpost: "rust_build_error" [drivers/gpu/nova-core/nova_core.ko] u=
ndefined!

Does it happen with the exact branch I posted?

https://github.com/Gnurou/linux/tree/b4/register

This one builds fine for me.

Gary also pointed out a few missing `inlines` that could potentially
trigger that kind of error. But I'd be curious to try and reproduce
myself if you can post your tree somewhere.
