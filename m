Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C9E3C0A1B;
	Mon,  1 Jun 2026 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325362; cv=fail; b=DsmEEvz56lEfyEY6O4kG2xJLtqYXP8bLKdhiAEACF9AKCEDd2aOanMkeVcEKeVEOhOsBTv7M+uSuUkjwNMn4tqIbGlvy3C0nUEVVqr+EWeP41tRqmSIuUu7gk8uZyvdNZjIITXYTjBn3ZeEkBaxXu/VS0139rE4bh7RBk3M88DY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325362; c=relaxed/simple;
	bh=T6bb/M79v8XnxMd3ExgAff98Mum12RKlujVA/VatRYE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hcWuUsT2funY+y0ZkW30usCz6xxIvoQawGkVoCbGAM8wpOmsoLLmXUSv1OqK3BecgZ7tt3Y0O/8SibRflYPaGHyg+Vf4lO9qQW9Ie2AW2qcS2KgjOzo+ahE5ho67yewZIBEVPFuA0F2HDVQZimwyI7Cb7+/xrNSKMRlvvV7DrBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=noKXtovF; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="noKXtovF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmJ80edU2V2Z8lkVZ7GvdFr9iZnz5ny7ZWOiG2tiFfKfm6l+PSw/2p9EP6YLtOQ0f/ukpitVyJT4lmoAdvLlWP18rBj0lGUNjHuVmKkZS/cJ2wR9GkEQ766mjdXuzanaG9nzX0pABh9T2pw0VBoGiz81dMm3Yka0jnFZWjHcRl9Ip9sUQtr7w+4FUFzWKmAyNoV63P8uQ+IfN9M7DTIA/MSZSVFO5TUdPCx3C2aqOFQDp8HbZZRRQwAb9XmKcvHMMrFmUJORg2tLbxTDVElFf9D6GpttK5XB+OdUheJL3RASLNJK340TnV75rUUHS0fnZ1a8Y/wf0q7H+Ewb3tQ9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waLKRYX3ydAIw+XdyVYVYsFBqA2S94Jn++IFBZzjReQ=;
 b=l07dKQCkdEzl7M0KPVPACcIxvQHwFaWMiqMEx/Ze+Lsnufy5SazSqk/dW3ydFvdWjVeCYRzW+dX6xfnQMek+9v5mwTotHK7ie7j5Z9idBu/umtOCa3PYWf8rs4Qj4kl2voQqgorGG065imrkb9IsjZLtJ5wp6IyUjeXcPLj28M3iXCwrnNEhJnm6IAKt89CoI+ts9KKXcorcTIy/DZYYOL/jcbTrDQYDGfI0hQxw+Gt528pqEEUjSS0qGgAPn/EVgNQ1W3EloQcoHeV6+xBysE+mPDaWseWLPkvJIIffa09vCnrTrFPOWedjpkhLCpwDj2izUKky+Oi2QCXHstzK+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waLKRYX3ydAIw+XdyVYVYsFBqA2S94Jn++IFBZzjReQ=;
 b=noKXtovFSgAAK/ZCBAvF8Cx3W9ubCmEwMNJivgBx522ctrbxQsHvKTxlBPXrEgfKwvbJcAs+pc2aoaP575T2lFPF8+UzmX0uGXi+TDxlkmOMX7F7rq9TO4xEs7mpE2GtFEtCO71sNVKrO28MRMh3ASA6IUCmaOeviDGB4J4s6cRlHO2tY54BwdvxhYuQg8ib+jsHg9Wk7T+QdOFzafvhmJDkFjY0DoDjCAkWgsXZfCScBKGiJb7yp/PEKfXBWrMjZcd0EpIZBdXniYXhTGh96u5uXB5G0AlFiLI8gvE/lvaKyCuxWXFyMF0JuYop1haVdHYXEpSTKJUiPGUBZwF1oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4210.namprd12.prod.outlook.com (2603:10b6:a03:203::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 14:49:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 14:49:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 23:49:11 +0900
Message-Id: <DIXSNZJJFDBA.2C0CU837SWSCH@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
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
Subject: Re: [PATCH v11 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-14-jhubbard@nvidia.com>
 <DIXSLENUBALG.8QIP71NU6DM7@nvidia.com>
In-Reply-To: <DIXSLENUBALG.8QIP71NU6DM7@nvidia.com>
X-ClientProxiedBy: TYCP301CA0062.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4210:EE_
X-MS-Office365-Filtering-Correlation-Id: d82db99c-bf80-40cb-36e5-08debfecf370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|56012099006|6133799003|18002099003|22082099003|3023799007|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	3JWytS3EMvm7MKKImtAR4Jp/a91+oVm/yvEjoWC3OSakHre8vxf5YGvb9RWsnqbMv1CF9o5EY18fJzUycTOATNcVBrKv0CY5fQRGZD6UpHGT7yxrSUMw/X7wPLtLWmiCwkCGzbhS5LH1JaCfc8W/b0Z/uZDOGfy4uWO1qe2IP9EfeleRUJ+uYjVl/4OQLZzb393nOzcZmw4rE0fuvsGpo17xMBIhZn7amHV/oFmo46WQp5tPFONigWugK8md4OIHzDOAAgjLjJP6biOHVRn1npYbAtDXdKF77SBXllUfUpWE0x12S2TsbKQC7MGZevUmfeBTyM+5K1pXz4OME+uPeQqlO/zqiOgP3Hgl+eO2IspbVVv+GSG+HPQxSQLW/dDKoyqcrvuCwaOxBerZoK99U8wHwHMlLco4tm+G7ZKd2HDAvTG6wTfITrzLihk1/vej5lcrLFm9E2ZzedDLoRUoLjE57hmts0aaGjcsXaDV3hjJ5tfTC+xKvitIqgEKADBmR46vJ/GXKZJZYNnLMdXmqOy6zEifBzFq4FOtX4XnnW7hj2UsgoKX9y7fJ5tom7WPsXmiTkEA39emsUlNLz/BSgajNgZqJMCABMe79SlLmw9rqAmig3D3SYi1EjB9coZfjgKLLbn5f8EyhVVUgA1cvK+Cl2CP5ax+yfqhWUiIHjW6bUjQSxyKJ9jYqrfxNFF/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2ZtM0o3cWRxQWlQYk5rNXVlK05OV2VjSWZRYVpwQUZPSnh0amxMN2x5ck9N?=
 =?utf-8?B?QUZ6NHA1cExTbnFIMENTd3FYYkhaZTRXTTFRMkF2UGRnYng1eVQyMkpWSlph?=
 =?utf-8?B?Ulp5QzlJVFpLQ05McXdFTmxjUG1na091VWZPRk1tSU93MzZQaHhpUnpQSGlB?=
 =?utf-8?B?WnIyVnBKT0Y5T3pGVVdZK2dRSlAxMFJLSktxY2FJL0ZaTWdOdUwrSHJzQXhu?=
 =?utf-8?B?SEVRMVdGQ3lkcE9jWlU4RG5IWEtnNzByZU9McFp5YlN6UXU5SWd6UWlWcTNy?=
 =?utf-8?B?WFJTY1NBOENjL01RNjMyYXdKU3VGWlpBbjlMK1oyWXN4WkxsdFptKytpbzhn?=
 =?utf-8?B?WStzbnJtTW1MVFVqYzVwQlMzYU1MVDdFTDc1T2J6VGdzTzYreXBRU0V2d0VJ?=
 =?utf-8?B?S0c3SmxnMEV0R0trZ25TUnJrYWpFVWx3WTEyS0JoUk15cU1RTEJiTCtwM0dq?=
 =?utf-8?B?KzRzbXVkMi8rK1laMkxndEdFeHpUZkdMZWJoYWRMeldHOUF6aC9XOE1uc3E5?=
 =?utf-8?B?QS8wZzFYZ24zbUtkSHFZcXFOanJ4MGhhckMzTFJTMTJWYVZJRUpWcTVnVHlZ?=
 =?utf-8?B?Y2s2blk5aEpQVVRTcjArMGJOeFgwdWpxWUM5ZVh5d3hyeStHYXI1VGNvcFcv?=
 =?utf-8?B?ZkM5cmV1aS9RbEE0K1pheEVLbDhBZFBYdmdDb05SeWFoc2ozY1pIQW9OVkFH?=
 =?utf-8?B?UzVVbGtsUU11ZkNWTWhOQmZTOVp1amVsZ1dMaUhobVJDVjlUU3BTREtrQm5T?=
 =?utf-8?B?YXM0My9jOW4zbWRxODZLdlNGRlRpOUNERnpMWENhQkNXRStVSFZrdEE2aHBZ?=
 =?utf-8?B?RlAzTnNuenFYUFlodksyL2JYdlVjaTJsN09aKzNZRHVNYnZqRzFEeUViNjM1?=
 =?utf-8?B?SEdwWlllZ3FJV3gydE9zdXJOUlJFc1hGU3YwUnZ1WnZ6ZXdZbzVRdEVHWHJh?=
 =?utf-8?B?dGdxZXQyZXpORTVFRzlDcWltQWNHYmErc2Y3WnY3SVVEMjVEbUVVOU10TUow?=
 =?utf-8?B?NWJ3ckpsWXZjMjFXd1VkYlpvOHR4bFd1bUZIRlJTRnZwczQySEtncytseVNv?=
 =?utf-8?B?dnh6MGtZZ3J2M0p3UXJiWTZUSkp0Y3Zac3BPckpzYUV5UVFjT3pTdnFRdXRQ?=
 =?utf-8?B?RmpRYnA5dVJ6K0FvY1NjaFBXZmxGSHVnekFtanJySzYwVDhjOU9yZXNiUHhn?=
 =?utf-8?B?U3ErQ29UY1FvT3dza1o4dGFzK2ZKRXhwZWlDaHpPWHZqYjVyeC91T3NkWi9S?=
 =?utf-8?B?Vk1WdnMzTCs5QWREZWF5d1U1VUdGQWxET2RqRUJzSnp5SENLZlpydDFnNUlB?=
 =?utf-8?B?Sko1RGthMDBRTmc1bEV4VVJqaUVJdElhYzB0K1FjUmFTYkIyNkk2U0ZkZ2dF?=
 =?utf-8?B?UXRDbWRuVGF4d3NZeVhvbEs3ZzdkVUdjdXF1alBMR1FEMkE3dDFNZWdGVHhw?=
 =?utf-8?B?M3AxZHFCSktCMUppUXdPTWMraWt3NGV2QW96bldmOSthN1F6dzdMb0JZUkxM?=
 =?utf-8?B?WlY4ZUR3aWpwZUxTc1ZTcC96Q0R6dWtpTzVRWjhjUVNTRjRDUVl6UlNpaWtr?=
 =?utf-8?B?dEEwN1p0TGpjL3dLMVg2WENDcFdYWW0wcXNmdStXb0dYdjF4WGZzcmVGZUEr?=
 =?utf-8?B?WkxJbWRjNEpzaytBZW96ZUFudlpjb1hCVHpkWGJWWVpON0lQaWE2bEJFM2hX?=
 =?utf-8?B?Vm1YQUlRNzBsbld3cEI1anF1Ri9XcW1MamxCS3VBNTgrOE54c0M4WVVPcm45?=
 =?utf-8?B?c1pMb1BVZ3BiUnZKcUVRMXpOT1R6QmtKZlI0bWhtMlYwUThhakxCck9XNVY4?=
 =?utf-8?B?OVZlRXEyTm5xT1V6VHREOFVmVDZtNmp5dlY3djZnT2E1bXdSb2huTXpSZk1l?=
 =?utf-8?B?VG9abnRYb1B2dGxvNG1US2I1Q21ub1BBdmc3emI1cGtTdzM0ZEdtOUxYbHll?=
 =?utf-8?B?MTRiNE1RSlFTcVZYQWt6cmVnenhPTy9BYm5ZS0tiUWxrdzRQY1kvZVM5S0l0?=
 =?utf-8?B?QVI1R3d3U1pzUFhHQlJBakpWRUN4M2xsMjh1cmhNK2tyd1h2b3pneFdrNGFC?=
 =?utf-8?B?c3gzYnNEQmZrQ3VNa3VGTFdQZXVMMm12bFZIVmVRdzVXOU1vTXdQTEtmTUlZ?=
 =?utf-8?B?VmhDQTZzTTJCZXlxMHU5WDhJM3pRVDVjWTRMRjNIbSs2dFo5anBtTG5zdU9w?=
 =?utf-8?B?RnNCdjBWYTJrNFJneCsrUE5semRzNmFZV255bGViYXBTWlUwaGhONTZLbWpS?=
 =?utf-8?B?VllzSC9zcGYySE45TklqZS9PZExHMzJsU1JHb2VUNXBVam1ndm55d1RZenVK?=
 =?utf-8?B?WXZwV0JRZzAyc1Jvd0svclUraFAzczVhQ3hNTzNhTmIxaUhtSGlFRE9aUWxH?=
 =?utf-8?Q?sYKL9G53HgJNq+6DOeBAusq0Hh/UBnF+g5kCBxxafZj97?=
X-MS-Exchange-AntiSpam-MessageData-1: IL6c0AF9lX+32g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82db99c-bf80-40cb-36e5-08debfecf370
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 14:49:15.2087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: et/RfoCUFWyTjXDc7sL6d/4cVfYImPBR9peTPpbDjKcsSa8J+ZTHoRepK/1+k3LnUQgAXPEr5IhE01YqayXN6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4210

On Mon Jun 1, 2026 at 11:45 PM JST, Alexandre Courbot wrote:
> On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
>> Extract the SHA-384 hash, RSA public key, and RSA signature from the
>> FMC ELF32 firmware sections. FSP Chain of Trust verification needs
>> these to validate the FMC image during boot.
>>
>> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware.rs     |  2 +-
>>  drivers/gpu/nova-core/firmware/fsp.rs | 90 ++++++++++++++++++++++++++-
>>  2 files changed, 88 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/f=
irmware.rs
>> index 6edb50b83a29..569efee0d4ac 100644
>> --- a/drivers/gpu/nova-core/firmware.rs
>> +++ b/drivers/gpu/nova-core/firmware.rs
>> @@ -641,7 +641,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> O=
ption<&'a [u8]> {
>>      }
>> =20
>>      /// Automatically detects ELF32 vs ELF64 based on the ELF header.
>> -    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<=
&'a [u8]> {
>> +    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<=
&'a [u8]> {
>>          // Check ELF magic.
>>          if elf.len() < 5 || elf.get(0..4)? !=3D b"\x7fELF" {
>>              return None;
>> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-co=
re/firmware/fsp.rs
>> index 011be1e571c2..dc28d0cc2d03 100644
>> --- a/drivers/gpu/nova-core/firmware/fsp.rs
>> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
>> @@ -15,13 +15,35 @@
>>      gpu::Chipset, //
>>  };
>> =20
>> +/// Size of the FSP SHA-384 hash, in bytes.
>> +pub(crate) const FSP_HASH_SIZE: usize =3D 48;
>> +/// Maximum size of the FSP public key (RSA-3072), in bytes.
>> +///
>> +/// The FMC ELF `publickey` section may be shorter, so the remaining by=
tes are zero-padded.
>> +pub(crate) const FSP_PKEY_SIZE: usize =3D 384;
>> +/// Maximum size of the FSP signature (RSA-3072), in bytes.
>> +///
>> +/// The FMC ELF `signature` section may be shorter, so the remaining by=
tes are zero-padded.
>> +pub(crate) const FSP_SIG_SIZE: usize =3D 384;
>> +
>> +/// Structure to hold FMC signatures.
>> +///
>> +/// C representation is used because this type is used for communicatio=
n with the FSP.
>> +#[derive(Debug, Clone, Copy)]
>> +#[repr(C)]
>> +pub(crate) struct FmcSignatures {
>> +    pub(crate) hash384: [u8; FSP_HASH_SIZE],
>> +    pub(crate) public_key: [u8; FSP_PKEY_SIZE],
>> +    pub(crate) signature: [u8; FSP_SIG_SIZE],
>> +}
>> +
>>  pub(crate) struct FspFirmware {
>>      /// FMC firmware image data (only the "image" ELF section).
>>      #[expect(dead_code)]
>>      pub(crate) fmc_image: Coherent<[u8]>,
>> -    /// Full FMC ELF for signature extraction.
>> +    /// FMC firmware signatures.
>>      #[expect(dead_code)]
>> -    pub(crate) fmc_elf: Firmware,
>> +    pub(crate) fmc_sigs: KBox<FmcSignatures>,
>>  }
>> =20
>>  impl FspFirmware {
>> @@ -41,7 +63,69 @@ pub(crate) fn new(
>> =20
>>          Ok(Self {
>>              fmc_image,
>> -            fmc_elf: fw,
>> +            fmc_sigs: Self::extract_fmc_signatures(&fw, dev)?,
>>          })
>>      }
>> +
>> +    /// Extract FMC firmware signatures for Chain of Trust verification=
.
>> +    ///
>> +    /// Extracts real cryptographic signatures from FMC ELF32 firmware =
sections.
>> +    /// Returns signatures in a heap-allocated structure to prevent sta=
ck overflow.
>> +    fn extract_fmc_signatures(
>> +        fmc_fw: &Firmware,
>> +        dev: &device::Device,
>> +    ) -> Result<KBox<FmcSignatures>> {
>> +        let get_section =3D |name: &str, max_len: usize| {
>> +            elf::elf_section(fmc_fw.data(), name)
>> +                .ok_or(EINVAL)
>> +                .inspect_err(|_| dev_err!(dev, "FMC firmware missing '{=
}' section\n", name))
>> +                .and_then(|section| {
>> +                    if section.len() > max_len {
>> +                        dev_err!(
>> +                            dev,
>> +                            "FMC {} section size {} > maximum {}\n",
>> +                            name,
>> +                            section.len(),
>> +                            max_len
>> +                        );
>> +                        Err(EINVAL)
>> +                    } else {
>> +                        Ok(section)
>> +                    }
>> +                })
>> +        };
>> +
>> +        let hash_section =3D get_section("hash", FSP_HASH_SIZE)?;
>> +        let pkey_section =3D get_section("publickey", FSP_PKEY_SIZE)?;
>> +        let sig_section =3D get_section("signature", FSP_SIG_SIZE)?;
>> +
>> +        // The hash section is a SHA-384 output: it must be exactly FSP=
_HASH_SIZE bytes.
>> +        if hash_section.len() !=3D FSP_HASH_SIZE {
>> +            dev_err!(
>> +                dev,
>> +                "FMC hash section size {} !=3D expected {}\n",
>> +                hash_section.len(),
>> +                FSP_HASH_SIZE
>> +            );
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let mut signatures =3D KBox::new(
>> +            FmcSignatures {
>> +                hash384: [0; _],
>> +                public_key: [0; _],
>> +                signature: [0; _],
>> +            },
>> +            GFP_KERNEL,
>> +        )?;
>
> This construct may create the 816 bytes long `FmcSignatures` instance on
> the stack, where space is at a premium. `KBox::init` guarantees in-place
> initialization:
>
>     let mut signatures =3D KBox::init(
>         init!(FmcSignatures {
>             hash384: [0; _],
>             public_key: [0; _],
>             signature: [0; _],
>         }),
>         )?;
>         GFP_KERNEL,
>
> And by chaining the initializer we can also avoid making `signatures`
> mutable:
>
>     let signatures =3D KBox::init(
>         init!(FmcSignatures {
>             hash384 <- Zeroable::init_zeroed(),
>             public_key <- Zeroable::init_zeroed(),
>             signature <- Zeroable::init_zeroed(),

Oops, I got a bit ahead of myself. The three lines above should be:

    hash384: [0; _],
    public_key: [0; _],
    signature: [0; _],

The rest should be working as expected.
