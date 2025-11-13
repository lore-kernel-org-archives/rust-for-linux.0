Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010021.outbound.protection.outlook.com [40.93.198.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F7335CBDF;
	Thu, 13 Nov 2025 20:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763066420; cv=fail; b=ERLgjHD1XsmJ9S7UPn3Vm2wrtS8yBRJXDAAlJIIcrosijn+H44wh15k3DUyxgnIOefUhmi6VYNikQZWScEVT8oSnWXqeDXot5GziWXEYmiQzLcUyFYhIBRUrLdRY9GoNVsLtm7/6Fk0DImHX1XlZ0n5zMfc1ySQd7kH5HEv7OzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763066420; c=relaxed/simple;
	bh=kNUWsI68ztwOJ/jzl37EGKzUQ3GxJBj0pxe4qK9SIxw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jlFbiu1td7aZ5RLPdVdyiqsyR0mak0tTlAG1dpqTFWGzKfQqt91Yafr8OF2C0yfB5NPyymtFP/DrqXParwzr+djzOyiaHp5c7Flc2tT9HWF73kFR1Etra2c8LxN9TCTWichXxZBSv57LzeL60mY8prgeTrG96N/lbQ/VMVApPMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eBGyPPqg; arc=fail smtp.client-ip=40.93.198.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eBGyPPqg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b46W32o4GEFCmsF0jz0xC32cDM40FpB6dIn2RpleJKzrXt/at1jTr6KXaLK6eA+VkxL/II59jaqHrQvx9SZhKc4iwouTmtVNgzmTnQr+1MpnVxNvXzG0dent4jSxYrV1UShY9PpR6RVyGdanpU2jemFzC5QLh7QkyD+ivgzoDEQIWXtvTvo6M63nVhUdVNCGk8xLbmxYeXg93b5e1rHkdI5NzAazSpW6+6s+G9KXef74ZLjJ2ToKCsvJ6fb8ha9143O2pneF53qL0TTlaynWKVNNQHb2c9gRWmfS++owzpqIg/sDPx6dsxDhi4gV6EzSqDkeRtdHD3rTN0FplreqUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzQrWUFUNe2vNo0g6aVZOTs7U5efaC12nBUMoOMa+gg=;
 b=NVVPiVT9/s0Hq/dH4TEKpNuEMGlQ6Z3v/v5md9G4L+FUst5ftR/Szl4FBF5S7K0pU/LKC3QqvDCdum0oKGVULLXyHM9zGBYOrPzFpqtLtFylVbnNeeuC7qE7lQeHoTrWkyAmWgujGHmuGBTl9MRwwPDsKLzK/P9boHt488Xfz7sBEmDKijCdz0uEKWyfomggEoFqCQdLo2WE4L5gzKdMqEgzumLNQjdxqMEEE0dIP8DiNBKt/8f+a9Mce3v4EwJB98fL3fLm/zVYzz6yXz7/zUdPb2cPge5+cEM3FiTBYsOUoyJHon2RPKCsxo06dgx0/WbxYCDbT2SaCAThYXPzIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzQrWUFUNe2vNo0g6aVZOTs7U5efaC12nBUMoOMa+gg=;
 b=eBGyPPqgIeTokFsSVW1okRiyQUozVuU9yEz8huAZB5yRdWeozw54b+e/vzgdaRiU8WtNO0RWj7ScBvUGpLWHFiN7xrEE5Y6Bh82KkjpLjJZn429e8LFbY4y49FWyARye4/IVVDLSVfcgbZ8UtcgE4BkoD2KXWPL7DO+7vWove3uFpnJP4GGLmTfDPBDtFbM6ldZ8JhHfOgH/bld1J+AQBHO2iazPooWcHw4PHX8lL/BduWUWydiYddFitvzqAeQw4qOOGZNg6qLzAB/R8BBzgyWynsZhHjkUBAw9O2LMzoc4z6BI/n4geTjjHMzI00bkLix8SYHCN477gjK5bQDHZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7794.namprd12.prod.outlook.com (2603:10b6:510:276::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 20:40:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 20:40:14 +0000
Message-ID: <0bf00b4c-3227-4214-b8ba-929cf044d9fa@nvidia.com>
Date: Thu, 13 Nov 2025 12:40:10 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] rust: workqueue: restrict delayed work to global
 wqs
To: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Philipp Stanner <phasta@kernel.org>, Tamir Duberstein <tamird@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Benno Lossin <lossin@kernel.org>
References: <20251113-create-workqueue-v2-0-8b45277119bc@google.com>
 <20251113-create-workqueue-v2-1-8b45277119bc@google.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251113-create-workqueue-v2-1-8b45277119bc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dad7e75-dc24-4a3f-be29-08de22f4d8fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFY0WXRaSzc4T0dDZFdnSWVaQytvUTFnUHlOZnlxaTJzY1hKVTVUZUNZQS83?=
 =?utf-8?B?Y0d6Q3BpclVhN0V6dzRsZEFiVTUyNWdsSkg5RzNGR1p6T2tJSnI1K0JNRkRY?=
 =?utf-8?B?aGovcVd2UWI0RFFaaUZmVVRHcXRzZmhOb002ck9TVUxJUFhtb3pTdHNDeFJy?=
 =?utf-8?B?QVcrNDQ0V3IwczM5alJkd1dTNXNIWlg3RWtWd2dmZG5FYXdsakVJU2ttTkov?=
 =?utf-8?B?MzlnWllkamVUMnpyZVlRdjRleCt5NFNvKzY4MjlxR3d4bzZKTUZ1VXV5a1Ar?=
 =?utf-8?B?MXdWV2dwS2tBbkg0UTljNmZIMWVCZ1c2ZVpGNzdST1BFK2xIUnpVU0Zpa1dT?=
 =?utf-8?B?alRBMjFLejJpc3pVUDVjaHVUTVBXZVhncVZsWVp0Q0Z6YkFkZGFnNWdhejd2?=
 =?utf-8?B?ai9aSHVSTTlJUnNmei9sTllTVERGbnludW1vdDIwSWZPb1kwdnZVZGxiWE9O?=
 =?utf-8?B?VWRwc3EwdlYvaVltcmhUb3FtOUttZUF3MW9sc3MzUGthTFlaQjlMbzVnQWVX?=
 =?utf-8?B?RDlBUFc0SzZXa2dVUHhMekxySUZZN3lJUHhxeThPVUZyS0cwRXJOYUZ1TTN6?=
 =?utf-8?B?NGtSaUJYUTl0dUpqU05hUjk2RVV6aXlKenNSc3Q4NndKWHg4YkVLZTdDT1Fz?=
 =?utf-8?B?TzRoU0dkZm4rMnBBRWRIVi9GZEQ0dS9BOWx2clB3Mld1U0c2ejFNMXJBT3RC?=
 =?utf-8?B?S2NlR0poaVhNdEM5b3BTT3YxNmp5RFg4U0EzQXR6eHR3elBMTjRYYXFSb1B6?=
 =?utf-8?B?Sk9MU2pOd2lSY2tyVlB0U0JzalV2ZGpBUW41TmlMZlA2QTJPejE4NDZxeUcz?=
 =?utf-8?B?MHFEdDJQd2UvZjF4U2o1a1R2ZG9mNmtWdnpLbUZaV3MwOUxWM0tMazZFUktK?=
 =?utf-8?B?VC8wVlJ6ejZ6dkVqQSt4UUtERHFVb3h5U2hxb3BGdmdSbFZRRlgwalREU05B?=
 =?utf-8?B?TmNMbDFBdmk1Y0Z6T0JpbVRoNGZwV0dQOVJaVWx6V1RrNktRQS83eWVVUzdC?=
 =?utf-8?B?QUVmbXM4Z1Y5Sy9JbUhzV042eWhXTTBxU3ZkNDhZL3RGSklIcVcvaXdQZ2hs?=
 =?utf-8?B?WVlld1lhQWdIbEJhNHNGbkJYT2FoWGFYSlRrU1VlR09nb3ZLOWowZnduRFY3?=
 =?utf-8?B?WGFmWFdpcms2QUs5bzJPdVdVK3dTUm5IdFZVYkFtaTRJSnNEY0pxT0JOcTFN?=
 =?utf-8?B?a1d4d1FuVEx6TWNGMVFLK29xQ1FUU1poWE05TFo1dzIxeGdFaHFaWnF4eWU1?=
 =?utf-8?B?a1MrbzVjYXAvTXA2dnRVdjRPelU2Um9NTmgxY3lxR09UdnVXdGlXRENCZ2U2?=
 =?utf-8?B?N1JrYlgvdkxjYlFvQzEwRFNZdHdLSEhYYzlTMWZROTFxampSTTdiUXNuWTl6?=
 =?utf-8?B?UVRjZG1HaFI5ZzVvVTdteXFCQmtMNHlicHduRFFsQXc3SXFwdU1RTFpuRlFT?=
 =?utf-8?B?ZWtyQkJVUDZ2UU10VDhtSWdIRzk3SERYWXZLakNwTmp6eCs4d2FKUlJpNi9E?=
 =?utf-8?B?NHJ3K1F2VElkbjg4UFRROU95c0tZWTJUaWRwRjV0MlNyUUZaZFlaTHZkZWdI?=
 =?utf-8?B?K05ZTnVtM0t5N0ZpNU51NUlMYmJNd0hMNWdlTG9pSndBeHZxRFRKYzNzWEVY?=
 =?utf-8?B?NGJsbWNZVHhDYTk1NmZuNVdabU9UL3k2bTg1cE5aYjlQT1lBejF4S3pDYk5s?=
 =?utf-8?B?NlcwakltVkU4Umt0ekQvQ3plYnNFOWFmTUMxeVNRZ0ttbThFcFA0UGhTYTl2?=
 =?utf-8?B?Z243ZUhtNHpyUGFodGVsZnVMVW9lQjQ0RVNraFlrbjdNY2FEaTE1R1B6RmVV?=
 =?utf-8?B?dGZYNHFSditzRHZEOWRWRWs2SUVuL21qK3hjcEFGSzZEQW00c1NoYTdtZnJt?=
 =?utf-8?B?azVWZnJoTmxoS0VNd2lSbTBZQWtNRGNUbzRUWVB1TkhtSHF1TGJwbnM5T2Zj?=
 =?utf-8?Q?tGP3IaSoe9GfprX1VVAzWMaJAJTGcPs+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UncyVkQ2a0Q0Mk0rVUlwOHRiZkdhYWU4UkRuUWJjSGxhL080SE5WL1h5dFZC?=
 =?utf-8?B?WE1JUmlsWTNRdk1WTWloQWZCQWlyZTE4QS9ZNWU2bE5YdlA5czYrZjZmTnpK?=
 =?utf-8?B?SlNIaGR4aHNZSWMrK3YyblNvN0pSZWkyVkEwQUh2ODFNYjk4WE9Nc3FGRHgr?=
 =?utf-8?B?QVU4Y09ZaC93cHR2ZVJOaE1EekFiVHp1a21KYWJIZnBZaTlKakd0WnBSNWE4?=
 =?utf-8?B?VEtsVzU4SCswTjQ5a09UYVFXV3RHVHd4SWpiZWptYktXTXhFNk5vS0xDZFFG?=
 =?utf-8?B?RnpERktQRU9CazlobitTcFNwcFBHL2dhSjlqWDI2b2J5NmJDU1dqY3BmRGNV?=
 =?utf-8?B?dHpOKzNXaFN4N0hQeTl4TEQ3Y3g2KzNndHdRSlZIY1ZkK0dqRkoyNkV0OS9t?=
 =?utf-8?B?VEFoYlphOGJLWDFjcDZaZVhLci9WUysrRm9PQlovcEFOeFp0cERxVTJBU0lD?=
 =?utf-8?B?NDhtL09TUzduYzlmTTFnWlFDTGxqbGpJakY3dGNsaTRKNHA0bWkvYzdFblUr?=
 =?utf-8?B?KzJGaitoaXdmZ295eW9pdzlzZjNIUHZzRy9YbjZJUDNVQjNiTWNjWHAvNG4y?=
 =?utf-8?B?R2U3VjNxUmRwMXZUVW15UVAySjlhS2lWYzNJK0FYWlMrc2tJRzR1dmVXTjlD?=
 =?utf-8?B?NTdyT1k5V1E3NFZDT2NlNjQ0MkV3RktsbE1YM0ZCc2pubGVOVFE5MFVnSWhG?=
 =?utf-8?B?aUQxYVFlU1hRK2s3b0pVc25QbjFSRWMyaG4wbVlpY3c3TUJ2cmN4cXYxcHF6?=
 =?utf-8?B?ZVRqOC9McG8yZStTc0EwUUt3Z3YyOFJranl0ZnBXRXZLTlpMY3JWNGxiMitK?=
 =?utf-8?B?K2FqZGJNQVg1Mmh4SUpGM0tsVFY0VFgzYXlsRnVhN3J0OTBLYkd1MlF2K3VG?=
 =?utf-8?B?UytBVW9CdjZjWWRydVZLUmh3dzM0cHBESzBUR1RzNHJWbEdxbFh4QU54b29q?=
 =?utf-8?B?eW5KMUhGbHRvLzQvUkxGNEhESjVJVEVmMjgyTWpnMlVHN1VTMGVIOG11eWxl?=
 =?utf-8?B?OXdFV3BwQ0tabXFyMkhZeHRsSXhkM0RPVk5JeThNNEw2U3V2RVZKcVl5WUY3?=
 =?utf-8?B?OHZadnFuTnpuN1M3Zkp3eDRCbE9pWGtzQ3ZuRjV2NXRpNXVqT0ZiVkcvbzN2?=
 =?utf-8?B?RE5wTjhYVDdqOGR0cWZFQTlabW1rME5kSnliR3lsVzEyNHRVQ1JkR0JQcFd5?=
 =?utf-8?B?UFRGSEV1LzBEdjJzMkdrUytjMDk5UGtCTmNsQTI2elpCbHIrRVRlY0c1dVFo?=
 =?utf-8?B?TXJoZW9YcCtkZDBLMDJsaFJEQmhvNnBJdzZodk5zVzZMZUw0aFZNM20wNlRq?=
 =?utf-8?B?WFQxMzJlYmxlczFSUTI4TkQ3ZGllc2VzMEZIcjZ6VFRLSTgvUEVvMUhFeFBh?=
 =?utf-8?B?M216SUt1OG4rc3RrMGp6dWtKN3F2dkx4YzRYczNHeEhPc1lsREFOVFB2cVJ2?=
 =?utf-8?B?OC96ZUE4Ky9rM0FMMi9FRUpBUWhvR1gzcW1xOTdZRnBGSWdVc0FxUjRUSHpz?=
 =?utf-8?B?WGVsMWJuS2NORTVURS92dXpsUFltVUZ0RzJtSnBFRFBzTFdOZ0cybTdZZ2Fq?=
 =?utf-8?B?UTBLc3Jvd3lSemtGV284UFBtRVV0Q20vRGRxT2VKaTdxSmxqOVVwa1BsQUt5?=
 =?utf-8?B?VTRFNTlrK3NsSnRZOVR2clBOZmxLWGN4cHBtLzI5ZTZzTFNYWlVqb1ZuL2Ni?=
 =?utf-8?B?dlMxd21tVnpROG5qaE1RbXlKWE55ZkpCV0ZQTWQybEN2NU4vb1FTSXpuTmFD?=
 =?utf-8?B?WGZFS0QrWk5HVWwwYkFlRkVlN2ZuRTFOb1dkRDFBSTlmaU4wdkRmR1ZMNlV2?=
 =?utf-8?B?NDd6bnF6YlBXaXVCUkFUTll0Si9lRnFMVkJSbTY0N0tZOU5LK3lHb3pOSkJ2?=
 =?utf-8?B?SUIzYjVOVHl2eWhUWWxNZFY3QnFQTmF3ait5TXVOeUdSc0JtNmhGclVOSVgz?=
 =?utf-8?B?cTJKUzQzQ1AvQVBpSzd5Mm5vWnoreUZobXNDTGFuYTRQMkUrV09STnl0eHY0?=
 =?utf-8?B?dWtvYXN2djMvYnNTWXhPcDkrVFBhNmR2TlR2UjJwcWRBalN5VkFNUTNsa1Y4?=
 =?utf-8?B?dEhTZ3k0a3RVeUw1SzUxM1dWVnpxUjc0bnR3N3UvN0VDZEpUWjNRV0haTGIv?=
 =?utf-8?Q?PWevZdG+z+AYkJojN19sJ7PsN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dad7e75-dc24-4a3f-be29-08de22f4d8fd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 20:40:14.2640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GdMKBi6VEVGn+e+uqMkaYft/nt6avf2niAsAYOpSrKZGZJW3f15JKD0PxRzz/3gmh/hyX6xiOdPZJeguE9rMkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7794

On 11/13/25 2:01 AM, Alice Ryhl wrote:
> When a workqueue is shut down, delayed work that is pending but not
> scheduled does not get properly cleaned up, so it's not safe to use
> `enqueue_delayed` on a workqueue that might be destroyed. To fix this,
> restricted `enqueue_delayed` to static queues.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/workqueue.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 706e833e9702ba4ba9aa7756b0e1fa80079a63fc..901102a8bca54c9fb58655d80fc9624b4dfe1dc1 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -297,7 +297,7 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
>      /// This may fail if the work item is already enqueued in a workqueue.
>      ///
>      /// The work item will be submitted using `WORK_CPU_UNBOUND`.
> -    pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::EnqueueOutput
> +    pub fn enqueue_delayed<W, const ID: u64>(&'static self, w: W, delay: Jiffies) -> W::EnqueueOutput

Hi Alice,

Looks good, just a documentation suggestion below.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>


I think it deserves a documentation comment (even though patch 2/2
has not yet arrived, we can still document this accurately), for example:

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 313d897fe93c..9e55d68f3b0d 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -299,6 +299,8 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
     /// Enqueues a delayed work item.
     ///
     /// This may fail if the work item is already enqueued in a workqueue.
+    /// This is only valid for global workqueues (with static lifetimes) because those are the only
+    /// ones that outlive all possible delayed work items.
     ///
     /// The work item will be submitted using `WORK_CPU_UNBOUND`.
     pub fn enqueue_delayed<W, const ID: u64>(&'static self, w: W, delay: Jiffies) -> W::EnqueueOutput


Also, rustfmt (1.8.0-stable) split the changed line for me, upon
saving the file, I'm not sure if it will do that for everyone. Just
a heads up.


thanks,
-- 
John Hubbard

