Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010025.outbound.protection.outlook.com [52.101.193.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00911DED4C;
	Thu,  2 Apr 2026 01:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775094143; cv=fail; b=sL0Xc+fZugld3xhQ3HyuC+nny0eB/DsjSeUHP+ecBSTGhoHE0QeoqTFojjl0kK7BUlcdwOXUeCYAaigveSQS7uUZoPUM6UHFlUsiu8MREF1iWRNirOGlXezj1qeYrBHDSZPOBXxPo8t29S8JMdPW93X+AAfB0ZHCHHFrPkNHqUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775094143; c=relaxed/simple;
	bh=WXtPDM9XpnhpFF9PaRelNkvl9wJtg8xkRjfDm4eaE3g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=oerlD/R9Ih1riFavL5hR+qkZAtsNIVXW3CEJwZYwxo9SCqPYusFsTuI7QRa7lZiy8j+VwQBBL7CsVfy52AvyVsoPxbsVIQZvWx0k+SEYM53T+DQKGOSDiBA0CIUfIHaKRjIwItY7jtI3VLL8jO/Tbhzv/lVt0un+d1mdLR5sr0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aQUNImKl; arc=fail smtp.client-ip=52.101.193.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aQUNImKl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgGWArTHWeUgllGWoDeGVbGOfPqlNIxpa00HkqtXsM8wcVyra83tLaWAqoOeJxchbl0L9LqlDWbsxVcmkXMsgIFCcOGAj6+1vsWX8ZYVywsZmZuHzQLX75uRleFgltyxh8W5F6dxbbUq8iSmUB6qLq+qxa9BTq4GYBskHxQ5bWqrfyVhtFTHQWa+s0/CcOP4Zezx8WUb7csEhMCx9b3U1fmFVJOVG7wRobMskM/ndd1VlTB20QInuC9zYQie/pATnsRgp00lzGwGh6heueEyr9kmYZRBjpQAqauftiLPGGXMv7Ytb+45JeFG8efBvVxUzOxraubi4oMZl6SDfl9Lfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXtPDM9XpnhpFF9PaRelNkvl9wJtg8xkRjfDm4eaE3g=;
 b=Y30LZuX9EOdbGFLmSjWjNsR3onytAUL798ObJjLAgx2ROQYLlGnTpU+qAIkUQwxBD/TBf056uJzXG4KPa9CCGW96ryzWRdJ/DU+Bae/63bhaVs9KfjF2VaUrrhsW9h6hD4edo5VQmbwpkdFDZa3+1WM1l8exOP/F+u/uAQDszeDGbCTtnPG7yBDtihjF0yG2IiRUDSgCww9VAK3nm9yXgTKXmZBufu2oCLEbXwBXGx5kW16APDPF86qy3czY/4C2W2Qg6blUKX52UrdHFX5HfdZzgmZcgz9iUwiYMHf3t9OJIIFPsxY1uKR2aM45ppDjqRlD7n45Sxq+uHEdqvlxiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXtPDM9XpnhpFF9PaRelNkvl9wJtg8xkRjfDm4eaE3g=;
 b=aQUNImKlHR5BFesMOfhF942avYoausfcBSf9KUkhd6Dz+Jh1EzRpUaHqebriD0Imtr1iZV9S/ezdr3KahqdAV5sUCqnimziUVJ138sa3btDiHdtEu7DViswemC6Apt3ZtZUgxW8hiPkuZ2PYarGXl1KmJeJxNa6MjxHjyKhbTXcKQwvoSKyjViuFUabU8w6rykFdLM7yIPHpY5dAOTJod8nBXdPx8ilLgbCtNdT/DYnDa5RqZHLJpCbpp7RNBVCU5EuQhxpA2na7aSLnrEZkYQDOmsZkVPQDAuK0C1mxVa03/6hzz2MwVLohB5u9s/4wf3TQ4z67qHI5Niv6pH6p4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6411.namprd12.prod.outlook.com (2603:10b6:208:388::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 01:42:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 01:42:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 10:42:12 +0900
Message-Id: <DHIACQY3YL4M.3F7LSF1BZBUY6@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, <'@google.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: sizes: add DeviceSize trait for device
 address space constants
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260331224319.107082-1-jhubbard@nvidia.com>
 <20260331224319.107082-2-jhubbard@nvidia.com> <aczpifqz5CoOFB3N@google.com>
 <c42c7074-5f17-4f61-878d-414762461826@nvidia.com>
 <DHI4SCEVOQXG.1LN5Z1S7XYYLM@kernel.org>
In-Reply-To: <DHI4SCEVOQXG.1LN5Z1S7XYYLM@kernel.org>
X-ClientProxiedBy: TYCP286CA0371.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9ea102-fb30-46ed-e120-08de90591243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	z2xLPp7O+Q7jfoajz3JXjGTUePOqu6Rk4pPyqIqmmBB1iFXRwyOu1lrcTRlfKv6t08o34iAEL2MZDhk5hXjzNu0gPxXbSYjWGJ6t5XEhZ9MRSPd88VPkliSKTVFJrU8VCVY12c/cF2F80SrnUECV7TP8ae/1y25vexSqlI2AZpqtWvOkS92WA7kSsOa6qLjluhRgVqvlzS6tzF8iW4zngW307SGtoO88e26P3/Hl+QfEWEsF56Ti7gPHaKZgP9PN9oV7UPqhBmRhCYdXGqvfyu5Hum3m1DkyMaG4t7QuJ2oLjyYYT9+rSQLSnJ8W194iJ0UJwxRGxeww+XzBGkDtPFOKk02Ysce4bLBJlCeSDrDrlQDgy+y4glI0FYtfIR/1EaEPaPWI6ZtKQ2cje0tUuAddIhmy4gK0U0XhOY+x1xkw+Z0XQ3NWyEgeJPIuDfe5les6sEyhdReuNdOt+P6Ny8eHuhkYxicyPcxsbGe2dOhkykXVx5bZsqxV3eOt6/nUBlfzARadEJfCyyUnlcMGSEGQDzmKlAExw0NsjYAfLYR/NHLEJqdfl5Y/rzUS/oLpEcHLz9+AvEO22z+CBFFJ4RRR9Y+oBE7LWM7beYcg61nOBgnyQ6Sa2SY6ruvtvM0JCDzkqj2oztF46BNpcYYEkA8DBD2ZI4UW1S30YHBU9Gs4K1vTWzwHkOCI11WokrRlybmX8BjtzCelwMNkdMG4mSne1aU8Olr85F4oqzw1Cas=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVdocEV0ZHRvdFFJSWJ2cTZXQW5OSlJZRDhFVTJzSHkrcGxiZnBXSFVRRmlF?=
 =?utf-8?B?TWlHbGFXbC90M000NWIyd0plWHNUaEJ6REliTHJobmNXUzFFT3EwWVFmaURX?=
 =?utf-8?B?bitPRk9nZWJyMW4xalVSUTZLVmZrUCtmVm02K1hYVnVTemw5QWpVY1Fqemo1?=
 =?utf-8?B?QXpXeU1hS1g5dEtmcG9SNGxTZTErWWFxRzZSOGVpMDNQRjlYZTQrOHZ3Wm4r?=
 =?utf-8?B?STd2TTNRenVyb3VDT21lWURjMTNGWVgrYmlnRW5Bc1ZwZG1wYTUyY3BTdHUx?=
 =?utf-8?B?NjhINVhXV0Q1ODhJbHJjOFNVaWZNa2NIVVlNUEs1aUVuUFNRaWsveEFoQU9k?=
 =?utf-8?B?eTFzUUxwYVZTVnRZcUtLc3dQSUhIVHZ5aWNhMXVBNlN2SjNJYk1lam9LR0RE?=
 =?utf-8?B?a1Z0aVZ5MVVBZHpjZU5lRDhuRVBRdGlMMDJWeVMrOEx5d0p3cWdsaW1LazAx?=
 =?utf-8?B?R1B6bzhVZVFsL2wrUDd4UHFoTFJqMmJyMkdONEVpcHpzQ2ZvWnNFVGNySEl6?=
 =?utf-8?B?bElaSUtzeEFCQURqSFZ3UDlXRlBVRnVubEs0L3RnYVBoVEk1b3Boa3BCWVNw?=
 =?utf-8?B?b2wrNUZ3MG01UndteXVRWndITzRkSE1tSmVmcERMajZzMjlheEtSZGwvWUtN?=
 =?utf-8?B?ZUpYQisvWkJrc3d3WXd5MEZPN0cyY3pnem85cFprV3grSEFkeFZyVGZZRGVt?=
 =?utf-8?B?SEtPQ1RtTTJhZVFyLzRVamJvK0Iyck1kUmZjNHdCMHhlaStGRVViNVc4VjlL?=
 =?utf-8?B?YVl0ZU1zZEFZZFFTV1BIU2J0MUMwcHdocHlGZEl5UE8yWG5zQ3R6WVUvQzFa?=
 =?utf-8?B?RVhtZVVZczRpMVN4aHBDZEd2bXU3Um1HUWI2Vnlnemg4NzFaSHVJMHFveGh0?=
 =?utf-8?B?ZXZLazFSclRmRzlPKzkyK3pJTzBHTStTMWpiL3c2bG5vUnRoaXNHTFRXSFBK?=
 =?utf-8?B?N3N0akRGSTlTK0RjZ2s3VnJLVGMwUFBSMHlzdndqdDRHd0JmSGxSRFFlTDg5?=
 =?utf-8?B?YlljZXpxOHBLNTAwMXpyNTVRM3NKU1hYaHRya2xXTjU3OWhoL2NNL3JDT1BK?=
 =?utf-8?B?SmRWNHN3dEo4T3Y0UWRYdFFzVGh0bDNMWEJ6Z1Q2bUhaem1nc2tMMlZCVG1J?=
 =?utf-8?B?cTRyR1RlTkZ3dy9vcEREK2hvbzVLYURvRzI2Y2JGTVd1YWdxbzI3RkVQMld2?=
 =?utf-8?B?Z21sWnJXQlpYdUdHKys3MlZRK2NZYnUzR2xsTVg2bHFQcUxQK2cvREkxWVB4?=
 =?utf-8?B?L3BCZzk0NUZTc29LanJhaDRMYmZUcEpkSSszZVRRMmo1aFEzUUZKMGNpRkND?=
 =?utf-8?B?NTRlMk02L2hoZXF0STVpVEFnZDVTRnFDNElHSktQQitsc3ZQQ29RZGZaUVlB?=
 =?utf-8?B?aW4wMkNYOWl0bW5QaTVaVmtKUkgzR2Q0ZDFQMXRSVy8zMzNRaFVFOENadUgv?=
 =?utf-8?B?MURJdjBDaDlUTkZwaDlnK1JwaHNzdTZ4dFU1RHVLUStKZW5GOVMvdlJMcFM4?=
 =?utf-8?B?em5Od2JHdWlZeWJXcFN0U1VlZ2Y0Nnk1MEpMYkFEOTFtWk5NbUIvUlJlbDY0?=
 =?utf-8?B?SS9abGZnYlhXMnpsZVJGNXJRQ3BTRUtXdXFtMTdhVzhxSzJxWGZkYVpSTkxW?=
 =?utf-8?B?ZU5mMWZFWVVCYTZRai9KMzNrUEhPVklpOU5aUDZES0dkbnBvZUovSjRERWwv?=
 =?utf-8?B?TllGeTRtOEN1M0orVmJWK3RwSjkyTWNxSW5CbCtScm1BQVRBM3FtajJMZE5N?=
 =?utf-8?B?VXprZ2FhV3p6TWZkYmFLVjVudTdLU1Q1cHRWS1NtM21SUWZlRjloVjRmMEhZ?=
 =?utf-8?B?MHlDZjJYOWkvcStyUEg2TlhvNldWOXFWdUVINjlEcmFDNDFVTzNnQTg2WGhP?=
 =?utf-8?B?aU5ndUxvQWFTRDl0RzR3WFRKVEcvNVA5RU13cE1OZ1UwTU83c21aQXh6T0Rv?=
 =?utf-8?B?QmxJQTJnK01lcU14YzJEajJyQmM4OUFpNmV1cnZ0WEY5enRBNSszZXl3c2Z1?=
 =?utf-8?B?K0lwUDM1ZkFTQkcwMkhObE5mQllCaDZPQTZrbUhmWndzd3QwVzc3RW8zanRr?=
 =?utf-8?B?dUpCaFU1aHl5MFMxdnZwSlZtL05BdHZTdDRPUU1CbXAwcncwNC83NXhzSWtz?=
 =?utf-8?B?QlpNUU5VRWRZeHBGWUxEa3MrcCttREFWTTg0MmpIV1doaDV5SzVrMHE5U1pC?=
 =?utf-8?B?blRCbW5wMlF4UnZRNFhLSTQ2SEdCbHJoWUVuVWtSZHA3UnN1RnQxek1oRGE3?=
 =?utf-8?B?L1lXYzh0N2gySitERUxyQUNvYzZqVHU5dk15bUU1T2Q2WW53dUw5YzFDMWR1?=
 =?utf-8?B?SmNqYUgvWTlPRWtxTlZ3em9MVmk2RGk4aStOZ1hHM3A1dmxlZkp2UWt2TktG?=
 =?utf-8?Q?G7HPoT/NrQRuzHw8xar6MTf8dmO/1/OipYUuXdjD6WgFD?=
X-MS-Exchange-AntiSpam-MessageData-1: HEPS5T6J1Zld+A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9ea102-fb30-46ed-e120-08de90591243
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 01:42:17.1319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRbpvk9AXyTCTaIAi8gvmCr4yZB/1JmHrNUG7TMzkZHJvil/s1vrs/FIVSwbervVmHdpnXk9XgRGvH54/hJ1+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6411

On Thu Apr 2, 2026 at 6:20 AM JST, Danilo Krummrich wrote:
> On Wed Apr 1, 2026 at 10:22 PM CEST, John Hubbard wrote:
>> On 4/1/26 2:46 AM, Alice Ryhl wrote:
>>> On Tue, Mar 31, 2026 at 03:43:18PM -0700, John Hubbard wrote:
>>>> The SZ_* constants are usize, matching the CPU pointer width. But
>>>> device address spaces have their own widths (32-bit MMIO windows,
>>>> 64-bit GPU framebuffers, etc.), so drivers end up casting these
>>>> constants with SZ_1M as u64 or helper functions. This adds
>>>> boilerplate with no safety benefit.
>>>>
>>>> Add a DeviceSize trait with associated SZ_* constants, implemented
>>>> for u32, u64, and usize. With the trait in scope, callers write
>>>> u64::SZ_1M or u32::SZ_4K to get the constant in their device's
>>>> native width. All SZ_* values fit in a u32, so every implementation
>>>> is lossless. Each impl has a const assert to catch any future
>>>> constant that would overflow.
>>>>
>>>> A define_sizes! macro generates everything from a single internal
>>>> list of names. The macro takes the target types as arguments, so
>>>> adding a new target type requires changing only the call site.
>>>>
>>>> Suggested-by: Danilo Krummrich <dakr@kernel.org>
>>>> Link: https://lore.kernel.org/all/DGB9G697GSWO.3VBFGU5MKFPMR@kernel.or=
g/
>>>> Link: https://lore.kernel.org/all/DGHI8WRKBQS9.38910L6FIIZTE@kernel.or=
g/
>>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>>=20
>>> The name `DeviceSize` seems overly specific to the use-case you had. It
>>
>> Yes, actually this name has been worrying me from the start. Because
>> it is not necessary to tie it, conceptually, to devices at all.
>>
>>> also makes it sound like something you would implement *for* the device
>>> type rather than for the integer type. Why not name it something more
>>> generic such as SizeConstants?
>>
>> Yes, thanks, I do think SizeConstants is more accurate.
>>
>> I'm inclined to make that change, unless someone else tells me not
>> to...let's see.
>
> I think I brought up the name DeviceSize when I proposed this.
>
> The reason is that when I proposed this I was thinking of it as a marker =
trait
> for "complex" types around u32, u64, etc. that we can use in DRM APIs (or=
 any
> other device centric API) though generics.
>
> For instance, instead of GpuVm<T>::vm_start() -> u64, it could be
> GpuVm<T, V: DeviceSize>::vm_start() -> V.

With the proposed naming this becomes `GpuVm<T, V: SizeConstants>`. Why
not just name it `Size`? Sure it's a very common word, but we have the
module to scope the name properly.
